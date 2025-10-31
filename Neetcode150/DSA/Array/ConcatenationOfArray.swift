//
//  ConcatenationOfArray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 20/08/25.
//

//https://leetcode.com/problems/concatenation-of-array/description/
//https://neetcode.io/problems/concatenation-of-array?list=neetcode250
class ConcatenationOfArray {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: nums = [1,2,1]
//        Output: [1,2,1,1,2,1]
        let nums = [1,2,1]
        let res = getConcatenation(nums)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func getConcatenation(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var ans = [Int](repeating: 0, count: 2*n)
        for i in 0..<n {
            ans[i] = nums[i]
            ans[i+n] = nums[i]
        }
        return ans
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func getConcatenation2(_ nums: [Int]) -> [Int] {
        return nums + nums
    }
    
}
