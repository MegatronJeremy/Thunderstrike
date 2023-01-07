#ifndef _MAPENTRY_HPP
#define _MAPENTRY_HPP

#include "KObject.hpp"

// Template linked hash map node
template<typename E, typename T>
class MapEntry : public KObject<MapEntry<E, T>> {
public:
    MapEntry<E, T>() = default;

    MapEntry<E, T>(E k, T v, MapEntry<E, T> *n = nullptr) :
            key(k), value(v), next(n) {}

    static MapEntry<E, T> *createObj(E k, T v, MapEntry<E, T> *n = nullptr);

    E getKey() const {
        return key;
    }

    void setKey(E key) {
        MapEntry::key = key;
    }

    T getValue() const {
        return value;
    }

    void setValue(T value) {
        MapEntry::value = value;
    }

    MapEntry *getNext() const {
        return next;
    }

    MapEntry *&getNext() {
        return next;
    }

    void setNext(MapEntry *next) {
        MapEntry::next = next;
    }


private:
    E key;
    T value;
    MapEntry *next = nullptr;
};

template<typename E, typename T>
MapEntry<E, T> *MapEntry<E, T>::createObj(E k, T v, MapEntry<E, T> *n) {
    MapEntry<E, T> *obj = KObject<MapEntry<E, T>>::createObj();
    obj->key = k;
    obj->value = v;
    obj->next = n;

    return obj;
}

#endif
