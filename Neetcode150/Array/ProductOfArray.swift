//
//  ProductOfArray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/12/24.
//

//https://leetcode.com/problems/product-of-array-except-self/
//https://neetcode.io/problems/products-of-array-discluding-self
class ProductOfArray {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,3,4]
        let result = productExceptSelf(nums)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var temp = 1
        var result = [Int](repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            result[i] = temp
            temp *= nums[i]
        }
        temp = 1
        
        for j in stride(from: nums.count - 1, through: 0, by: -1) {
            result[j] *= temp
            temp *= nums[j]
        }
        
        return result
    }
    
}
