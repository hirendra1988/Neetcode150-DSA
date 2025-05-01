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
    
    // Using Memoization
    // Time Complexity: O(n * sum/2) ≈ O(n * sum)
    //Space Complexity: O(n * sum) (for memoization table) or O(n) (if optimized using bottom-up DP)
    func canPartition(_ nums: [Int]) -> Bool {
        var sum = 0
        for num in nums {
            sum += num
        }
        if sum % 2 != 0 {
            return false
        }
        let target = sum / 2
        var memo: [[Bool?]] = Array(repeating: [Bool?](repeating: nil, count: target + 1), count: nums.count + 1)
        return subsetSum(nums, nums.count, target, &memo)
    }
    
    func subsetSum(_ nums: [Int], _ n: Int, _ sum: Int, _ memo: inout [[Bool?]]) -> Bool {
        if n == 0 {
            return false
        }
        if sum == 0 {
            return true
        }
        if let res = memo[n][sum] {
            return res
        }
        if nums[n-1] <= sum {
            memo[n][sum] = subsetSum(nums, n-1, sum - nums[n-1], &memo) || subsetSum(nums, n-1, sum, &memo)
        } else {
            memo[n][sum] = subsetSum(nums, n-1, sum, &memo)
        }
        return memo[n][sum] ?? false
    }
    
    // Using Recursion
    //Time Complexity: O(2ⁿ) || Space Compelxity: O(n)
    func canPartition2(_ nums: [Int]) -> Bool {
        var sum = 0
        for num in nums {
            sum += num
        }
        if sum % 2 != 0 {
            return false
        }
        return subsetSum2(nums, nums.count, sum / 2)
    }
    
    func subsetSum2(_ nums: [Int], _ n: Int, _ sum: Int) -> Bool {
        if n == 0 {
            return false
        }
        if sum == 0 {
            return true
        }
        if nums[n-1] <= sum {
            return subsetSum2(nums, n-1, sum - nums[n-1]) || subsetSum2(nums, n-1, sum)
        }
        return subsetSum2(nums, n-1, sum)
    }
    
    //Time Complexity: O(n*target) || Space Compelxity: O(target)
    func canPartition1(_ nums: [Int]) -> Bool {
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
