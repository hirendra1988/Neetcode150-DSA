//
//  MaximumProductSubarray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/02/25.
//

//https://leetcode.com/problems/maximum-product-subarray/
//https://neetcode.io/problems/maximum-product-subarray
class MaximumProductSubarray {
    
    init() {
        //        Input: nums = [2,3,-2,4]
        //        Output: 6
        //        Explanation: [2,3] has the largest product 6.
        runTest()
    }
    
    func runTest() {
        let nums = [2,3,-2,4]
        let res = maxProduct(nums)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var prefix = 1
        var suffix = 1
        var res = nums[0]
        for i in 0..<nums.count {
            prefix = (prefix == 0) ? nums[i] : prefix * nums[i]
            res = max(res, prefix)
        }
        
        for j in stride(from: nums.count - 1, through: 0, by: -1) {
            suffix = suffix == 0 ? nums[j] : suffix * nums[j]
            res = max(res, suffix)
        }
        return res
    }
    
    // Kadane's Algorithm
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func maxProduct1(_ nums: [Int]) -> Int {
        var res = nums.max()!
        var curMin = 1
        var curMax = 1
        
        for n in nums {
            let tmp = curMax * n
            curMax = max(max(tmp, curMin * n), n)
            curMin = min(min(tmp, curMin * n), n)
            res = max(res, curMax)
        }
        
        return res
    }
    
}
