//
//  KthLargestElement.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 29/01/25.
//

//https://leetcode.com/problems/kth-largest-element-in-a-stream/
//https://neetcode.io/problems/kth-largest-integer-in-a-stream
//https://www.youtube.com/watch?v=wkTsKXPRjSk
class KthLargestElement {
    
    init() {
//        ["KthLargest", "add", "add", "add", "add", "add"]
//        [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
//
//        Output: [null, 4, 5, 5, 8, 8]
        runTest()
    }
    
    func runTest() {
        let k = 3
        let items = [4, 5, 8, 2]
        let kthLargest = KthLargest(k, items)
        print(kthLargest.add(3))
        print(kthLargest.add(5))
        print(kthLargest.add(10))
        print(kthLargest.add(9))
        print(kthLargest.add(4))
    }
    
}

// Using Priority Queue
class KthLargest {
    
    var minHeap = [Int]()
    var k: Int
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            _ = add(num)
        }
    }
    
    // Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func add(_ val: Int) -> Int {
        if minHeap.count < k || minHeap.first! < val {
            minHeap.append(val)
            minHeap.sort()
            if minHeap.count > k {
                minHeap.removeFirst()
                minHeap.sort()
            }
        }
        return minHeap.first!
    }
}



// Using Sorting
class KthLargest1 {
    
    var items = [Int]()
    var k: Int = 0
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.items = nums
    }
    
    func add(_ val: Int) -> Int {
        items.append(val)
        let sortedArr = items.sorted(by: >)
        return sortedArr[k-1]
    }
}
