//
//  BurstBalloons.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 14/02/25.
//

//https://leetcode.com/problems/burst-balloons/
//https://neetcode.io/problems/burst-balloons
//https://www.youtube.com/watch?v=VFskby7lUbw
class BurstBalloons {
    
    init() {
        //        Input: nums = [3,1,5,8]
        //        Output: 167
        //        Explanation:
        //        nums = [3,1,5,8] --> [3,5,8] --> [3,8] --> [8] --> []
        //        coins =  3*1*5    +   3*5*8   +  1*3*8  + 1*8*1 = 167
        runTest()
        
    }
    
    func runTest() {
        let nums = [3,1,5,8]
        let res = maxCoins(nums)
        print(res)
    }
    
    func maxCoins(_ nums: [Int]) -> Int {
        let nums = [1] + nums + [1]
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums.count), count: nums.count)
        let left = 1
        let right = nums.count - 2
        return dfs(left, right, nums, &dp)
    }
    
    func dfs(_ left: Int, _ right: Int, _ nums: [Int], _ dp: inout [[Int]]) -> Int {
        if left > right {
            return 0
        }
        
        if dp[left][right] != 0 {
            return dp[left][right]
        }
        
        for i in left...right {
            var coins = nums[left-1] * nums[i] * nums[right+1]
            coins += dfs(left, i-1, nums, &dp) + dfs(i+1, right, nums, &dp)
            dp[left][right] = max(dp[left][right], coins)
        }
        
        return dp[left][right]
    }
    
}
