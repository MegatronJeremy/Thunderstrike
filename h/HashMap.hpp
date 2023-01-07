#ifndef _HASHMAP_HPP
#define _HASHMAP_HPP

#include "KObject.hpp"
#include "MapEntry.hpp"
#include "DummyMutex.hpp"

// Kernel template structure - linked list hash table with prime number modulus hash function
template<typename E, typename T>
class HashMap {
public:
    HashMap() = delete;

    HashMap(const HashMap<E, T> &) = delete;

    void operator=(const HashMap<E, T> &) = delete;

    static void initHashTable(void *space, Mutex *mutex = nullptr);

    static int put(MapEntry<E, T> *entry);

    static T get(E Key);

    static bool contains(E key) {
        return get(key) != nullptr;
    }

    static int remove(E key);

private:
    static Mutex *getMutex();

    static size_t getHash(E key) {
        return ((size_t) key) % DEFAULT_HASH_SIZE;
    }

    static MapEntry<E, T> **hashTable;

    static Mutex *mutex;
};

template<typename E, typename T>
MapEntry<E, T> **HashMap<E, T>::hashTable = nullptr;

template<typename E, typename T>
Mutex *HashMap<E, T>::mutex = nullptr;

template<typename E, typename T>
void HashMap<E, T>::initHashTable(void *space, Mutex *m) {
    mutex = m;
    hashTable = (MapEntry<E, T> **) space;
    for (size_t i = 0; i < DEFAULT_HASH_SIZE; i++) {
        hashTable[i] = nullptr;
    }
}

template<typename E, typename T>
Mutex *HashMap<E, T>::getMutex() {
    if (mutex == nullptr) mutex = Mutex::createObj();

    if (hashTable == nullptr) {
        initHashTable(kmalloc(DEFAULT_HASH_SIZE * sizeof(MapEntry<E, T> *)));
    }

    return mutex;
}

template<typename E, typename T>
int HashMap<E, T>::put(MapEntry<E, T> *entry) {
    if (!entry) return -1;

    DummyMutex dummy(getMutex());

    size_t hash = getHash(entry->getKey());

    MapEntry<E, T> *curr = hashTable[hash];
    while (curr && curr->getNext()) curr = curr->getNext();

    (!curr ? hashTable[hash] : curr->getNext()) = entry;

    entry->setNext(nullptr);

    return 0;
}

template<typename E, typename T>
T HashMap<E, T>::get(E key) {
    DummyMutex dummy(getMutex());

    size_t hash = getHash(key);

    MapEntry<E, T> *curr = hashTable[hash];
    while (curr && curr->getKey() != key) curr = curr->getNext();

    if (!curr) {
        return nullptr;
    }

    return curr->getValue();
}

template<typename E, typename T>
int HashMap<E, T>::remove(E key) {
    DummyMutex dummy(getMutex());

    size_t hash = getHash(key);

    MapEntry<E, T> *curr = hashTable[hash], *prev = nullptr;
    while (curr && curr->getKey() != key) prev = curr, curr = curr->getNext();

    if (!curr) {
        return -1;
    }

    (!prev ? hashTable[hash] : prev->getNext()) = curr->getNext();

    return 0;
}

#endif
