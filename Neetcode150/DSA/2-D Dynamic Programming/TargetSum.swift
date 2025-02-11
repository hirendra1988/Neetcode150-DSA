//
//  TargetSum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/02/25.
//

//https://leetcode.com/problems/target-sum/
//https://neetcode.io/problems/target-sum
class TargetSum {
    
    init() {
//        Input: nums = [1,1,1,1,1], target = 3
//        Output: 5
//        Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
//        -1 + 1 + 1 + 1 + 1 = 3
//        +1 - 1 + 1 + 1 + 1 = 3
//        +1 + 1 - 1 + 1 + 1 = 3
//        +1 + 1 + 1 - 1 + 1 = 3
//        +1 + 1 + 1 + 1 - 1 = 3
        runTest()
    }
    
    func runTest() {
        let nums = [1,1,1,1,1], target = 3
        let res = findTargetSumWays(nums, target)
        print(res)
    }
    
    // Using Memoization
    //Time Complexity: O(m*n), Space Complexity :O(m*n)
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var memo = [String: Int]()
        return findTargetSumWaysHelper(nums, target, 0, &memo)
    }
    
    func findTargetSumWaysHelper(_ nums: [Int], _ target: Int, _ i: Int, _ memo: inout [String: Int]) -> Int {
        if i >= nums.count {
            return target == 0 ? 1 : 0
        }
        if let cacheResult = memo["\(target),\(i)"] {
            return cacheResult
        }
        let plus = findTargetSumWaysHelper(nums, target + nums[i], i+1, &memo)
        let minus = findTargetSumWaysHelper(nums, target - nums[i], i+1, &memo)
        memo["\(target),\(i)"] = plus + minus
        return memo["\(target),\(i)"]!
    }
    
    // Using Recursion
    //Time Complexity: O(2^n), Space Complexity :O(m)
    func findTargetSumWays1(_ nums: [Int], _ target: Int) -> Int {
        return findTargetSumWaysHelper1(nums, target, 0)
    }
    
    func findTargetSumWaysHelper1(_ nums: [Int], _ target: Int, _ i: Int) -> Int {
        if i == nums.count {
            return target == 0 ? 1 : 0
        }
        let plus = findTargetSumWaysHelper1(nums, target + nums[i], i+1)
        let minus = findTargetSumWaysHelper1(nums, target - nums[i], i+1)
        return plus + minus
    }
    
}
