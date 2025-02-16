//
//  MaximumSubarray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/02/25.
//

//https://leetcode.com/problems/maximum-subarray/
//https://neetcode.io/problems/maximum-subarray
class MaximumSubarray {
    
    init() {
//        Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
//        Output: 6
//        Explanation: The subarray [4,-1,2,1] has the largest sum 6.
        runTest()
    }
    
    func runTest() {
        let nums = [-2,1,-3,4,-1,2,1,-5,4]
        let res = maxSubArray(nums)
        print(res)
    }
    
    // Using kadane'e algo
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var maxSum = nums[0]
        var result = nums[0]
        for i in 1..<nums.count {
            maxSum = max(maxSum + nums[i], nums[i])
            if maxSum > result {
                result = maxSum
            }
        }
        return result
    }
    
}
