//
//  PartitionEqualSubsetSum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/02/25.
//

//https://leetcode.com/problems/partition-equal-subset-sum/
//https://neetcode.io/problems/partition-equal-subset-sum
//https://www.youtube.com/watch?v=W3OSNlSIJJM&t=3s
class PartitionEqualSubsetSum {
    
    init() {
//        Input: nums = [1,5,11,5]
//        Output: true
//        Explanation: The array can be partitioned as [1, 5, 5] and [11].
        runTest()
    }
    
    func runTest() {
        let nums = [1,5,11,5]
        let res = canPartition(nums)
        print(res)
    }
    
    //Time Complexity: O(n*target) || Space Compelxity: O(target)
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        for num in nums {
            sum += num
        }
        if sum % 2 != 0 {
            return false
        }
        let target = sum / 2
        var dp = [Bool](repeating: false, count: target + 1)
        dp[0] = true
        
        for num in nums {
            for i in stride(from: target, through: num, by: -1) {
                dp[i] = dp[i] || dp[i-num]
            }
        }
        return dp[target]
    }
    
}
