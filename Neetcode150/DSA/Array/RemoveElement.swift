//
//  RemoveElement.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 01/11/25.
//

//https://leetcode.com/problems/remove-element/description/
//https://neetcode.io/problems/remove-element?list=neetcode250
class RemoveElement {
    
    init() {
        runTest()
    }
    
    func runTest() {
        var nums = [3,2,2,3], val = 3
        print(removeElement(&nums, val))
        print(nums)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var index = 0
        var result = 0
        for i in 0..<nums.count {
            if nums[i] != val {
                nums[index] = nums[i]
                index += 1
                result += 1
            }
        }
        return result
    }
    
}
