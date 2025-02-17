//
//  JumpGameII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 17/02/25.
//

//https://leetcode.com/problems/jump-game-ii/
//https://neetcode.io/problems/jump-game-ii
class JumpGameII {
    
    init() {
//        Input: nums = [2,3,1,1,4]
//        Output: true
//        Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
        runTest()
    }
    
    func runTest() {
        let nums = [2,3,1,1,4]
        let result = jump(nums)
        print(result)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func jump(_ nums: [Int]) -> Int {
        var result = 0
        var maxPos = 0
        var end = 0
        for i in 0..<nums.count - 1 {
            maxPos = max(maxPos, i+nums[i])
            if i == end {
                end = maxPos
                result += 1
            }
        }
        return result
    }
    
}
