//
//  KClosestPointsToOrigin.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 30/01/25.
//

import math_h

//https://leetcode.com/problems/k-closest-points-to-origin/
//https://neetcode.io/problems/k-closest-points-to-origin
class KClosestPointsToOrigin {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let points = [[3,3],[5,-1],[-2,4]], k = 2
        let res = kClosest(points, k)
        print(res)
    }
    
    // MARK: Using MinHeap
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let maxHeap = MaxHeap()
        // Insert points into the heap
        for point in points {
            let x = point[0]
            let y = point[1]
            let dist = x * x + y * y  // Calculate the squared distance
            maxHeap.push((dist, point))  // Insert the tuple (distance, x, y)
            // If the heap size exceeds k, remove the largest element (max distance)
            if maxHeap.count > k {
                maxHeap.pop()
            }
        }
        // Prepare the result array by extracting the closest points
        var res: [[Int]] = []
        while let currentPoint = maxHeap.pop() {
            res.append(currentPoint.1)
        }
        
        return res
    }
    
    // MARK: Using Sorting
    // Time Complexity: O(nlogk) || Space Compelxity: O(n)
    func kClosest1(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var distances = [(Double, [Int])]()
        for point in points {
            let x1: Double = Double(point[0])
            let y1: Double = Double(point[1])
            let distance = sqrt(pow(x1, 2) + pow(y1, 2))
            distances.append((distance, point))
        }
        let sortedDistances = distances.sorted {
            $0.0 < $1.0
        }
        let allPoints = sortedDistances.map {
            $0.1
        }
        return Array(allPoints[0...k-1])
    }
    
    func kClosest2(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        var tempArr = [(Double, Int)]()
        for i in 0..<points.count {
            let point = points[i]
            let x1 = point[0]
            let y1 = point[1]
            let sqrt = sqrt(Double(x1 * x1 + y1 * y1))
            tempArr.append((sqrt, i))
        }
        var sorted = tempArr.sorted { $0.0 < $1.0 }
        for (sqrt, index) in sorted {
            result.append(points[index])
            if result.count == k {
                break
            }
        }
        return result
    }

}

class MaxHeap {
    private var heap: [(Int, [Int])]
    
    init() {
        self.heap = []
    }
    
    func push(_ element: (Int, [Int])) {
        heap.append(element)
        heapifyUp(from: heap.count - 1)
    }
    
    // Remove and return the top element of the heap
    func pop() -> (Int, [Int])? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 {
            return heap.removeLast()
        } else {
            heap.swapAt(0, heap.count - 1)
            let top = heap.removeLast()
            heapifyDown(from: 0)
            return top
        }
    }
    
    // Get the size of the heap
    var count: Int {
        return heap.count
    }
    
    // Move element up to maintain heap property
    private func heapifyUp(from index: Int) {
        var currentIndex = index
        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2
            if heap[currentIndex].0 > heap[parentIndex].0 {
                heap.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
            } else {
                break
            }
        }
    }
    
    // Move element down to maintain heap property
    private func heapifyDown(from index: Int) {
        var largest = index
        let left = 2*index + 1
        let right = 2*index + 2
        
        if left < count, heap[left].0 > heap[largest].0 {
            largest = left
        }
        if right < count, heap[right].0 > heap[largest].0 {
            largest = right
        }
        
        if largest != index {
            let temp = heap[largest]
            heap[largest] = heap[index]
            heap[index] = temp
            heapifyDown(from: largest)
        }
    }
}
