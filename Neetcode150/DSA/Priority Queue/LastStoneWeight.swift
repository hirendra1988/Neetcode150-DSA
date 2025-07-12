//
//  LastStoneWeight.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 29/01/25.
//

//https://leetcode.com/problems/last-stone-weight/
//https://neetcode.io/problems/last-stone-weight
class LastStoneWeight {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let stones = [1,3]//[2,7,4,1,8,1]
        let res = lastStoneWeight(stones)
        print(res)
    }
    
    // Time Complexity: O(nlogn) = O(n2)
    // Space Compelxity: O(n)
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var sortedArray = stones.sorted(by: >)
        while sortedArray.count > 1 {
            let first = sortedArray.removeFirst()
            let second = sortedArray.removeFirst()
            if first != second {
                sortedArray.append(first - second)
                sortedArray = sortedArray.sorted(by: >)
            }
        }
        return sortedArray.first ?? 0
    }

    func lastStoneWeight2(_ stones: [Int]) -> Int {
        var heap = MaxHeap2()
        for stone in stones {
            heap.push(stone)
        }
        while heap.count > 1 {
            let firstLargest = heap.pop() ?? 0
            let secondLargest = heap.pop() ?? 0
            if firstLargest != secondLargest {
                heap.push(firstLargest - secondLargest)
            }
        }
        return heap.peek() ?? 0
    }
    
}

class MaxHeap2 {
    private var heap = [Int]()

    init() {
        
    }

    var count: Int {
        return heap.count
    }

    func push(_ val: Int) {
        heap.append(val)
        heapifyUp(heap.count - 1)
    }

    func pop() -> Int? {
        if count == 0 {
            return nil
        }
        let last = heap[count - 1]
        heap[count - 1] = heap[0]
        heap[0] = last
        let top = heap.removeLast()
        heapifyDown(0)
        return top
    }

    func peek() -> Int? {
        return heap.first
    }

    func heapifyUp(_ index: Int) {
        var childIdx = index
        while childIdx > 0 {
            var parentIdx = (childIdx - 1) / 2
            if heap[childIdx] > heap[parentIdx] {
                let temp = heap[childIdx]
                heap[childIdx] = heap[parentIdx]
                heap[parentIdx] = temp
                childIdx = parentIdx
            } else {
                break
            }
        }
    }

    func heapifyDown(_ index: Int) {
        var largest = index
        var left = index * 2 + 1
        var right = index * 2 + 2
        if left < heap.count, heap[left] > heap[largest] {
            largest = left
        }
        if right < heap.count, heap[right] > heap[largest] {
            largest = right
        }
        if largest != index {
            let temp = heap[index]
            heap[index] = heap[largest]
            heap[largest] = temp
            heapifyDown(largest)
        }
    }
}
