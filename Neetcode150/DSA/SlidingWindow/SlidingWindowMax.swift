//
//  SlidingWindowMax.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 10/12/24.
//

//https://leetcode.com/problems/sliding-window-maximum/
//https://neetcode.io/problems/sliding-window-maximum
//https://www.youtube.com/watch?v=MCvGwtkqJS0
class SlidingWindowMax {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [1,3,-1,-3,5,3,6,7], k = 3
        let result = maxSlidingWindow(nums, k)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(k)
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var deque = [Int]() //Double-ended queue to store indices
        
        // Process the first k elements (first window)
        for i in 0..<k {
            // Remove elements from the rear of the deque that are smaller than or equal to the current element
            while !deque.isEmpty, nums[i] >= nums[deque.last!] {
                deque.removeLast()
            }
            // Add the current index to the deque
            deque.append(i)
        }
        var result = [Int]()
        for i in k..<nums.count {
            //The element at the front of the deque is the largest of the previous window
            result.append(nums[deque.first!])
            
            // Remove indices that are out of the current window
            while !deque.isEmpty, deque.first! <= i - k {
                deque.removeFirst()
            }
            
            // Remove elements from the rear that are smaller than or equal to the current element
            while !deque.isEmpty, nums[i] >= nums[deque.last!] {
                deque.removeLast()
            }
            
            // Add the current index
            deque.append(i)
        }
        result.append(nums[deque.first!])
        return result
    }
    
    // Time Complexity: O(n * k) || Space Compelxity: O(n)
    func maxSlidingWindow2(_ nums: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var maxValue = 0
        for i in 0...nums.count - k {
            maxValue = nums[i]
            for j in i..<i+k {
                maxValue = max(maxValue, nums[j])
            }
            result.append(maxValue)
        }
        return result
    }
}

