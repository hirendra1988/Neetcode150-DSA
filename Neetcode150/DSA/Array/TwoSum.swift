//
//  TwoSum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/12/24.
//

//https://neetcode.io/problems/two-integer-sum
// https://leetcode.com/problems/two-sum/
//https://www.algoexpert.io/questions/two-number-sum
class TwoSum {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [2,7,11,15]
        let target = 9
        let result = twoSum(nums, target)
        print(result)
    }
    
    // If output will be [2,7]
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap = [Int: Int]()
        for num in nums {
            let diff = target - num
            if let value = hashMap[diff] {
                return [diff, value]
            }
            hashMap[num] = diff
        }
        return []
    }
    // 7,
    // If output will be [0,1] (indices)
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap = [Int: Int]()
        for i in 0..<nums.count {
            let diff = target - nums[i]
            if let index = hashMap[diff] {
                return [index, i]
            }
            hashMap[nums[i]] = i
        }
        return []
    }
}
