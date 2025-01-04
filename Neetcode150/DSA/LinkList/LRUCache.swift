//
//  LRUCache.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/01/25.
//

//https://leetcode.com/problems/lru-cache/
//https://neetcode.io/problems/lru-cache
class LRUCacheTest {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Explanation
//        LRUCache lRUCache = new LRUCache(2);
//        lRUCache.put(1, 1); // cache is {1=1}
//        lRUCache.put(2, 2); // cache is {1=1, 2=2}
//        lRUCache.get(1);    // return 1
//        lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
//        lRUCache.get(2);    // returns -1 (not found)
//        lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
//        lRUCache.get(1);    // return -1 (not found)
//        lRUCache.get(3);    // return 3
//        lRUCache.get(4);    // return 4
        
//        ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
//        [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
//        Output
//        [null, null, null, 1, null, -1, null, -1, 3, 4]
        
        let lruCache = LRUCache(2)
        lruCache.put(1, 1)
        lruCache.put(2, 2)
        print(lruCache.get(1), terminator: " -> ")
        lruCache.put(3, 3)
        print(lruCache.get(2), terminator: " -> ")
        lruCache.put(4, 4)
        print(lruCache.get(1), terminator: " -> ")
        print(lruCache.get(3), terminator: " -> ")
        print(lruCache.get(4), terminator: " -> ")
    }
    
}

// Time Complexity: O(1) || Space Compelxity: O(n)
class LRUCache {

    var hashMap = [Int: Node]()
    var size: Int = 0
    var head: Node?
    var tail: Node?

    init(_ capacity: Int) {
        self.size = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = hashMap[key] {
            setHead(node)
            return node.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = hashMap[key] {
            node.value = value
            setHead(node)
        } else {
            if hashMap.count == self.size {
                if let lastKey = tail?.key {
                    hashMap[lastKey] = nil
                    removeTail()
                }
            }
            let newNode = Node(key, value)
            hashMap[key] = newNode
            setHead(newNode)
        }
    }

    func unlinkNode(_ node: Node?) {
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
        node?.next = nil
        node?.prev = nil
    }

    func setHead(_ node: Node?) {
        if node === head {
            return
        }
        
        if node === tail {
            removeTail()
        }
       
        unlinkNode(node)
        node?.next = head
        head?.prev = node
        head = node

        if tail == nil || tail === head {
            tail = head
        }
    }

    func removeTail() {
        if head === tail {
            tail = nil
            head = nil
            return
        }
        tail = tail?.prev
        tail?.next = nil
    }
}

class Node {
    var key: Int
    var value: Int
    var next: Node?
    var prev: Node?
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}
