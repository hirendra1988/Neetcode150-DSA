//
//  SumOfAllSubsetXORTotals.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 07/10/25.
//

//https://leetcode.com/problems/sum-of-all-subset-xor-totals/description/
//https://neetcode.io/problems/sum-of-all-subset-xor-totals?list=neetcode250
class SumOfAllSubsetXORTotals {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [1,3]
        let res = subsetXORSum(nums)
        print(res)
    }
    
    //Time Complexity: O(2ⁿ) || Space Complexity: O(n)
    func subsetXORSum(_ nums: [Int]) -> Int {
        return backTracking(nums, 0, 0)
    }
    
    func backTracking(_ nums: [Int], _ start: Int, _ xor: Int) -> Int {
        var sum = xor
        for i in start..<nums.count {
            sum += backTracking(nums, i+1, xor ^ nums[i])
        }
        return sum
    }

    func backTracking2(_ nums: [Int], _ start: Int, _ xor: Int) -> Int {
        if start == nums.count {
            return xor
        }
        let pick = backTracking2(nums, start + 1, xor ^ nums[start])
        let noPick = backTracking2(nums, start + 1, xor)
        return pick + noPick
    }

}
