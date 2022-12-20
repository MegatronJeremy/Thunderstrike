#ifndef _LINKEDHASHTABLE_HPP
#define _LINKEDHASHTABLE_HPP

#include "KObject.hpp"
#include "LinkedHashNode.hpp"
#include "DummyMutex.hpp"

// Kernel template structure - linked list hash table with prime number modulus hash function
template<typename T>
class LinkedHashTable : public KObject<LinkedHashTable<T>> {
public:
    LinkedHashTable() = delete;

    LinkedHashTable(const LinkedHashTable<T> &) = delete;

    void operator=(const LinkedHashTable<T> &) = delete;

    void defaultCtor() override;

    void defaultDtor() override;

    static int insert(LinkedHashNode<T> *elem);

    static T *get(uint64 id);

    static bool contains(uint64 id) {
        return get(id) != nullptr;
    }

    static LinkedHashNode<T> *getHashTable() {
        return hashTable;
    }

    static int remove(uint64 id);

private:
    static Mutex *getMutex();

    static uint64 getHash(uint64 id) {
        return id % DEFAULT_HASH_SIZE;
    }

    static LinkedHashNode<T> **hashTable;
};

template<typename T>
LinkedHashNode<T> **LinkedHashTable<T>::hashTable = nullptr;

template<typename T>
void LinkedHashTable<T>::defaultCtor() {
    hashTable = kmalloc(DEFAULT_HASH_SIZE * sizeof(LinkedHashNode<T>));
    for (int i = 0; i < DEFAULT_HASH_SIZE; i++) {
        hashTable[i] = nullptr;
    }
}

template<typename T>
void LinkedHashTable<T>::defaultDtor() {
    for (int i = 0; i < DEFAULT_HASH_SIZE; i++) {
        LinkedHashNode<T>::deleteObj(hashTable[i]);
    }
    kfree(hashTable);
}

template<typename T>
inline Mutex *LinkedHashTable<T>::getMutex() {
    static auto *mutex = (Mutex *) Mutex::createObj();
    return mutex;
}

template<typename T>
int LinkedHashTable<T>::insert(LinkedHashNode<T> *elem) {
    if (!elem) return -1;

    DummyMutex dummy(getMutex());

    uint64 hash = getHash(elem->id);
    LinkedHashNode<T> *curr = hashTable[hash];
    while (curr && curr->next) curr = curr->next;
    (!curr ? hashTable[hash] : curr->next) = elem;

    return 0;
}

template<typename T>
T *LinkedHashTable<T>::get(uint64 id) {
    DummyMutex dummy(getMutex());

    uint64 hash = getHash(id);
    LinkedHashNode<T> *curr = hashTable[hash];
    while (curr && curr->id != id) curr = curr->next;

    if (!curr) {
        return nullptr;
    }

    return curr->data;
}

template<typename T>
int LinkedHashTable<T>::remove(uint64 id) {
    DummyMutex dummy(getMutex());

    uint64 hash = getHash(id);

    LinkedHashNode<T> *curr = hashTable[hash], *prev = nullptr;

    while (curr && curr->id != id) prev = curr, curr = curr->next;
    if (!curr) {
        return -1;
    }

    (!prev ? hashTable[hash] : prev->next) = curr->next;

    return 0;
}

#endif
