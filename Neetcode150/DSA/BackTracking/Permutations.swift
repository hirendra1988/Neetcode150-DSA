//
//  Permutations.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/03/25.
//

//https://leetcode.com/problems/permutations/
//https://neetcode.io/problems/permutations
//https://www.youtube.com/watch?v=H232aocj7bQ
class Permutations {
    
    init() {
//        Input: nums = [1,2,3]
//        Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,3]
        let res = permute(nums)
        print(res)
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        backTracking(nums, &result, &tempSet)
        return result
    }
    
    //Time Complexity: O(n!*n) || Space Compelxity: O(n!*n)
    func backTracking(_ nums: [Int], _ result: inout [[Int]], _ tempSet: inout [Int]) {
        if tempSet.count == nums.count {
            result.append(tempSet)
            return
        }
        
        for i in 0..<nums.count {
            if tempSet.contains(nums[i]) {
                continue
            }
            tempSet.append(nums[i])
            backTracking(nums, &result, &tempSet)
            tempSet.removeLast()
        }
    }
    
}
