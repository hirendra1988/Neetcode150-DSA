//
//  DesignHashMap.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 28/08/25.
//

//https://leetcode.com/problems/design-hashmap/submissions/1751576807/
//https://neetcode.io/problems/design-hashmap?list=neetcode250
class DesignHashMap {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let myHashMap = MyHashMap()
        myHashMap.put(1, 1)
        myHashMap.put(2, 2)
        print(myHashMap.get(1))
        print(myHashMap.get(3))
        myHashMap.put(2, 1)
        print(myHashMap.get(2))
        print(myHashMap.remove(2))
        print(myHashMap.get(2))
    }
    
}

class MyHashMap {
    
    private var buckets = [[(key: Int, value: Int)]]()
    private var size = 1000
    
    init() {
        buckets = Array(repeating: [], count: size)
    }
    
    private func getIndex(_ key: Int) -> Int {
        return key % size
    }
    
    func put(_ key: Int, _ value: Int) {
        let index = getIndex(key)
        var array = buckets[index]
        for i in 0..<array.count {
            if array[i].key == key {
                array[i].value = value
                buckets[index] = array
                return
            }
        }
        array.append((key: key, value: value))
        buckets[index] = array
    }
    
    func get(_ key: Int) -> Int {
        let index = getIndex(key)
        let array = buckets[index]
        for i in 0..<array.count {
            if array[i].key == key {
                return array[i].value
            }
        }
        return -1
    }
    
    func remove(_ key: Int) {
        let index = getIndex(key)
        buckets[index].removeAll { $0.key == key }
    }
    
}
