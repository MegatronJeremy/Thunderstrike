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

    void setKey(E k) {
        key = k;
    }

    T getValue() const {
        return value;
    }

    void setValue(T v) {
        value = v;
    }

    MapEntry *getNext() const {
        return next;
    }

    MapEntry *&getNext() {
        return next;
    }

    void setNext(MapEntry *n) {
        next = n;
    }


private:
    E key;
    T value;
    MapEntry *next = nullptr;
};

template<typename E, typename T>
MapEntry<E, T> *MapEntry<E, T>::createObj(E k, T v, MapEntry<E, T> *n) {
    MapEntry<E, T> *obj = KObject<MapEntry<E, T>>::createObj();
    if (!obj) return nullptr;

    obj->key = k;
    obj->value = v;
    obj->next = n;

    return obj;
}

#endif
