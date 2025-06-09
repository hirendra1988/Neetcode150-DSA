//
//  MissingNumber.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 28/02/25.
//

//https://leetcode.com/problems/missing-number/
//https://neetcode.io/problems/missing-number
class MissingNumber {
    
    init() {
        //        Input: nums = [3,0,1]
        //        Output: 2
        //        Explanation:
        //        n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
        runTest()
    }
    
    func runTest() {
        let nums = [3,0,1]
        let res = missingNumber(nums)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func missingNumber(_ nums: [Int]) -> Int {
        var sum = 0
        let n = nums.count
        let totalSum = (n * (n+1))/2
        for num in nums {
            sum += num
        }
        return totalSum - sum
    }
    
}
