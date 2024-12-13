//
//  LongestSubArrayWithKFreq.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 13/12/24.
//

//https://leetcode.com/problems/length-of-longest-subarray-with-at-most-k-frequency/
class LongestSubArrayWithKFreq {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,3,1,2,3,1,2], k = 2 //Output: 6
        let result = maxSubarrayLength(nums, k)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var hashMap = [Int: Int]()
        var left = 0
        var maxLength = Int.min
        for right in 0..<nums.count {
            hashMap[nums[right], default: 0] += 1
            while hashMap[nums[right]]! > k {
                hashMap[nums[left]]! -= 1
                left += 1
            }
            maxLength = max(maxLength, right - left + 1)
        }
        return maxLength
    }
    
}
