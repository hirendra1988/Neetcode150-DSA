//
//  SplitArrayLargestSum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/11/25.
//

//https://leetcode.com/problems/split-array-largest-sum/
//https://neetcode.io/problems/split-array-largest-sum?list=neetcode250
//https://www.youtube.com/watch?v=eq6dAJefOqc/
class SplitArrayLargestSum {
    
    init() {
        runTest()
    }
    
//    Input: nums = [7,2,5,10,8], k = 2
//    Output: 18
    func runTest() {
        let nums = [7,2,5,10,8], k = 2
        print(splitArray(nums, k))
    }
    
    // Time Complexity: O(n log(sum)) || Space Compelxity: O(1)
    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        var maxVal = 0
        var sum = 0
        for num in nums {
            sum += num
            maxVal = max(maxVal, num)
        }
        
        if k == nums.count {
            return maxVal
        }
        
        var left = maxVal
        var right = sum
        var result = 0
        
        while left <= right {
            let mid = (left + right)/2
            if isPossible(nums, k, mid) {
                result = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return result
    }
    
    func isPossible(_ nums: [Int], _ k: Int, _ mid: Int) -> Bool {
        var sa = 1 // sa -> subarray
        var sum = 0
        for num in nums {
            sum += num
            if sum > mid {
                sa += 1
                sum = num
            }
        }
        return sa <= k
    }
    
}
