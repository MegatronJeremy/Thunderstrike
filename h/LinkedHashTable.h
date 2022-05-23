#ifndef _LINKEDHASHTABLE_H
#define _LINKEDHASHTABLE_H

#include "KernelObject.h"
#include "LinkedHashNode.h"
#include "Mutex.h"

template<typename T>
class LinkedHashTable : public KernelObject {
public:
    LinkedHashTable(const LinkedHashTable<T> &) = delete;
    void operator=(const LinkedHashTable<T> &) = delete;

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
    LinkedHashTable() = default;

    static Mutex *getMutex();

    static uint64 getHash(uint64 id) {
        return id % DEFAULT_BUFFER_SIZE;
    }

    static LinkedHashNode<T> *hashTable[DEFAULT_BUFFER_SIZE];
};

template<typename T>
LinkedHashNode<T> *LinkedHashTable<T>::hashTable[DEFAULT_BUFFER_SIZE]{};

template<typename T>
inline Mutex *LinkedHashTable<T>::getMutex() {
    static auto *mutex = new Mutex;
    return mutex;
}

template<typename T>
int LinkedHashTable<T>::insert(LinkedHashNode<T> *elem) {
    if (!elem) return -1;

    getMutex()->wait();
    
    uint64 hash = getHash(elem->id);
    LinkedHashNode<T> *curr = hashTable[hash];
    while (curr && curr->next) curr = curr->next;
    (!curr ? hashTable[hash] : curr->next) = elem;
    
    getMutex()->signal();

    return 0;
}

template<typename T>
T *LinkedHashTable<T>::get(uint64 id) {
    getMutex()->wait();

    uint64 hash = getHash(id);
    LinkedHashNode<T> *curr = hashTable[hash];
    while (curr && curr->id != id) curr = curr->next;

    if (!curr) {
        getMutex()->signal();
        return nullptr;
    }
    
    getMutex()->signal();

    return curr->data;
}

template<typename T>
int LinkedHashTable<T>::remove(uint64 id) {
    getMutex()->wait();

    uint64 hash = getHash(id);

    LinkedHashNode<T> *curr = hashTable[hash], *prev = nullptr;

    while (curr && curr->id != id) prev = curr, curr = curr->next;
    if (!curr) {
        getMutex()->signal();
        return -1;
    }

    (!prev ? hashTable[hash] : prev->next) = curr->next;
    
    getMutex()->signal();
    return 0;
}



#endif
