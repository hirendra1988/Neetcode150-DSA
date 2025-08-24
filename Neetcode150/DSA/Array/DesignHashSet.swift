//
//  DesignHashSet.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/08/25.
//

//https://leetcode.com/problems/design-hashset/
//https://neetcode.io/problems/design-hashset?list=neetcode250
class DesignHashSet {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let obj = MyHashSet()
        obj.add(1)
        obj.remove(1)
        let res: Bool = obj.contains(1)
        print(res)
    }
    
}

class MyHashSet {
    
    var table: [Bool]
    
    init() {
        self.table = Array(repeating: false, count: 1000001)
    }
    
    func add(_ key: Int) {
        table[key] = true
    }
    
    func remove(_ key: Int) {
        table[key] = false
    }
    
    func contains(_ key: Int) -> Bool {
        return table[key]
    }
}
