//
//  HouseRobber.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/02/25.
//

//https://leetcode.com/problems/house-robber/
//https://neetcode.io/problems/house-robber
//https://www.youtube.com/watch?v=VXqUQYGMnQg
class HouseRobber {
    
    init() {
//        Input: nums = [1,2,3,1]
//        Output: 4
//        Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
//        Total amount you can rob = 1 + 3 = 4.
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,3,1]
        let res = rob(nums)
        print(res)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<nums.count {
            dp[i] = max(nums[i] + dp[i-2], dp[i-1])
        }
        return dp[nums.count - 1]
    }
    
}
