//
//  HouseRobberII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/02/25.
//

//https://www.youtube.com/watch?v=ucmqYGVGQK8
//https://leetcode.com/problems/house-robber-ii/
//https://neetcode.io/problems/house-robber-ii
class HouseRobberII {
    
    init() {
        //        Input: nums = [2,3,2]
        //        Output: 3
        //        Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
        runTest()
    }
    
    func runTest() {
        let nums = [2,3,2]
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
        return max(helperRob(Array(nums.dropFirst())),
                   helperRob(Array(nums.dropLast())))
    }
    
    func helperRob(_ nums: [Int]) -> Int {
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
