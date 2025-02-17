//
//  JumpGame.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 17/02/25.
//

//https://leetcode.com/problems/jump-game/
//https://neetcode.io/problems/jump-game
class JumpGame {
    
    init() {
//        Input: nums = [2,3,1,1,4]
//        Output: true
//        Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
        runTest()
    }
    
    func runTest() {
        let nums = [2,3,1,1,4]
        let result = canJump(nums)
        print(result)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func canJump(_ nums: [Int]) -> Bool {
        var target = nums.count - 1
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if (i + nums[i]) >= target {
                target = i
            }
        }
        return target == 0
    }
    
}
