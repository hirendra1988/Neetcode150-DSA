//
//  FindTheDuplicateNumber.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/01/25.
//

//https://leetcode.com/problems/find-the-duplicate-number/
//https://neetcode.io/problems/find-duplicate-integer
class FindTheDuplicateNumber {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: nums = [1,3,4,2,2]
//        Output: 2
        let nums = [1,3,4,2,2]
        let res = findDuplicate(nums)
        print(res)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[nums[0]]
        
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
            
            if slow == fast {
                slow = 0
                while slow != fast {
                    slow = nums[slow]
                    fast = nums[fast]
                }
            }
        }
        return slow
    }
}
