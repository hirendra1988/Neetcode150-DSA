//
//  LongestIncreasingSubsequence.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/02/25.
//

//https://leetcode.com/problems/longest-increasing-subsequence/
//https://neetcode.io/problems/longest-increasing-subsequence
class LongestIncreasingSubsequence {
    
    init() {
        //        Input: nums = [10,9,2,5,3,7,101,18]
        //        Output: 4
        //        Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
        runTest()
    }
    
    func runTest() {
        let nums = [10,9,2,5,3,7,101,18]
        let res = lengthOfLIS(nums)
        print(res)
    }

    // Using Stack
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var stack = [Int]()
        for num in nums {
            if stack.isEmpty {
                stack.append(num)
            } else if num > stack.last! {
                stack.append(num)
            } else {
                var left = 0
                var right = stack.count - 1
                while left <= right {
                    let mid = (left + right) / 2
                    if stack[mid] >= num {
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                }
                stack[left] = num
            }
        }
        return stack.count
    }
    
    //Time Complexity: O(n^2) || Space Compelxity: O(n)
    func lengthOfLIS2(_ nums: [Int]) -> Int {
        var maxLength = 1
        var dp = [Int](repeating: 1, count: nums.count)
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            maxLength = max(maxLength, dp[i])
        }
        return maxLength
    }

}
