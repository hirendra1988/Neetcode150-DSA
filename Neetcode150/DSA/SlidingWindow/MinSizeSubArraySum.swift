//
//  MinSizeSubArraySum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/12/24.
//

//https://leetcode.com/problems/minimum-size-subarray-sum/
class MinSizeSubArraySum {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let target = 7, nums = [2,3,1,2,4,3] // Output: 2
        let result = minSubArrayLen(target, nums)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var minLength = Int.max
        var currentSum = 0

        for right in 0..<nums.count {
            currentSum += nums[right]
            while currentSum >= target {
                minLength = min(minLength, right - left + 1)
                currentSum -= nums[left]
                left += 1
            }
        }
        return minLength == Int.max ? 0 : minLength
    }
    
}
