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

class KthLargest2 {
    
    var minHeap = KthLargestMinHeap2()
    var k = 0
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            _ = add(num)
        }
    }
    
    func add(_ val: Int) -> Int {
        if minHeap.count < k {
            minHeap.push(val)
        } else if let top = minHeap.peek(), top < val {
            minHeap.pop()
            minHeap.push(val)
        }
        return minHeap.peek() ?? 0
    }
}

class KthLargestMinHeap2 {
    private var heap = [Int]()
    
    init() {
        
    }
    
    var count: Int {
        return heap.count
    }
    
    func peek() -> Int? {
        return heap.first
    }
    
    func push(_ val: Int) {
        heap.append(val)
        shiftUp(count - 1)
    }
    
    func pop() -> Int? {
        if heap.isEmpty {
            return nil
        }
        let temp = heap[count - 1]
        heap[count - 1] = heap[0]
        heap[0] = temp
        let top = heap.removeLast()
        shiftDown(0)
        return top
    }
    
    func shiftDown(_ index: Int) {
        var smallest = index
        var left = 2*index + 1
        var right = 2*index + 2
        if left < heap.count, heap[left] < heap[smallest] {
            smallest = left
        }
        if right < heap.count, heap[right] < heap[smallest] {
            smallest = right
        }
        if smallest != index {
            let temp = heap[smallest]
            heap[smallest] = heap[index]
            heap[index] = temp
            shiftDown(smallest)
        }
    }
    
    func shiftUp(_ index: Int) {
        var child = index
        while child > 0 {
            var parent = (child - 1)/2
            if heap[child] < heap[parent] {
                let temp = heap[child]
                heap[child] = heap[parent]
                heap[parent] = temp
                child = parent
            } else {
                break
            }
        }
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
