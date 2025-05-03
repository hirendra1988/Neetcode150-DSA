//
//  KthLargestElementInArray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 31/01/25.
//

//https://leetcode.com/problems/kth-largest-element-in-an-array/
//https://neetcode.io/problems/kth-largest-element-in-an-array
class KthLargestElementInArray {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [3,2,1,5,6,4], k = 2
        let res = findKthLargest(nums, k)
        print(res)
    }
    
    // Time Complexity: O(klogn) || Space Compelxity: O(1)
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        for i in stride(from: nums.count/2 - 1, through: 0, by: -1) {
            maxHeapify(i, nums.count, &nums)
        }
        for j in stride(from: nums.count - 1, through: nums.count - k, by: -1) {
            let temp = nums[0]
            nums[0] = nums[j]
            nums[j] = temp
            maxHeapify(0, j, &nums)
        }
        return nums[nums.count - k]
    }
    
    func maxHeapify(_ i: Int, _ count: Int, _ nums: inout [Int]) {
        var largest = i
        let left = 2*i + 1
        let right = 2*i + 2
        
        if left < count, nums[left] > nums[largest] {
            largest = left
        }
        if right < count, nums[right] > nums[largest] {
            largest = right
        }
        
        if largest != i {
            let temp = nums[largest]
            nums[largest] = nums[i]
            nums[i] = temp
            maxHeapify(largest, count, &nums)
        }
    }
    
    func findKthLargest1(_ nums: [Int], _ k: Int) -> Int {
        let minHeap = MinHeap2()
        for num in nums {
            minHeap.push(num)
            if minHeap.count > k {
                _ = minHeap.pop()
            }
        }
        return minHeap.peek()!
    }
    
}

class MinHeap2 {
    
    private var heap = [Int]()
    
    init() {
        
    }
    
    var count: Int {
        return heap.count
    }
    
    func peek() -> Int? {
        return heap.first
    }
    
    func push(_ element: Int) {
        heap.append(element)
        heapifyUp(heap.count - 1)
    }
    
    func pop() -> Int? {
        if heap.isEmpty {
            return nil
        }
        if heap.count == 1 {
            return heap.removeLast()
        }
        heap.swapAt(0, heap.count - 1)
        let top = heap.removeLast()
        heapifyDown(0)
        return top
    }
    
    private func heapifyUp(_ index: Int) {
        var currIndex = index
        while currIndex > 0 {
            let parentIdx = (currIndex - 1) / 2
            if heap[currIndex] < heap[parentIdx] {
                heap.swapAt(currIndex, parentIdx)
                currIndex = parentIdx
            } else {
                break
            }
        }
    }
    
    private func heapifyDown(_ index: Int) {
        var smallest = index
        let left = 2*index + 1
        let right = 2*index + 2
        if left < count, heap[left] < heap[smallest] {
            smallest = left
        }
        if right < count, heap[right] < heap[smallest] {
            smallest = right
        }
        if smallest != index {
            heap.swapAt(smallest, index)
            heapifyDown(smallest)
        }
    }
    
}
