//
//  SingleNumber.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 27/02/25.
//

//https://leetcode.com/problems/single-number/
class SingleNumber {
    
    init() {
//        Input: nums = [2,2,1]
//        Output: 1
        runTest()
    }
    
    func runTest() {
        let nums = [2,2,1]
        let res = singleNumber(nums)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func singleNumber(_ nums: [Int]) -> Int {
        var res = nums[0]
        for i in 1..<nums.count {
            res = res ^ nums[i]
        }
        return res
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func singleNumber1(_ nums: [Int]) -> Int {
        var hashMap = [Int: Int]()
        for num in nums {
            hashMap[num, default: 0] += 1
        }
        for (key, val) in hashMap {
            if val == 1 {
                return key
            }
        }
        return 0
    }
    
}
