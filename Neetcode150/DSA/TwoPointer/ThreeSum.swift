//
//  ThreeSum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/12/24.
//

//https://leetcode.com/problems/3sum/
//https://neetcode.io/problems/three-integer-sum
class ThreeSum {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [0,0,0,0]//[-1,0,1,2,-1,-4]
        //Output: [[-1,-1,2],[-1,0,1]]
        let result = threeSum(nums)
        print(result)
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        let sortedNums = nums.sorted()
        var left = 1
        var right = sortedNums.count - 1
        
        for i in 0..<sortedNums.count {
            left = i + 1
            right = sortedNums.count - 1
            while left < right {
                var sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if sum == 0 {
                    result.insert([sortedNums[i], sortedNums[left], sortedNums[right]])
                    left += 1
                    right -= 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return Array(result)
    }
    
}
