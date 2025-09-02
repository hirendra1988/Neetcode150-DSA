//
//  RemoveDuplicates.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/09/25.
//

//https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
//https://neetcode.io/problems/remove-duplicates-from-sorted-array?list=neetcode250
class RemoveDuplicatesFromSortedList {
    
    init() {
        runTest()
    }
    
    func runTest() {
        var nums = [0,0,1,1,1,2,2,3,3,4]
        let count = removeDuplicates(&nums)
        print(count)
        print(nums)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var index = 1
        for i in 1..<nums.count {
            if nums[i] != nums[i-1] {
                nums[index] = nums[i]
                index += 1
            }
        }
        return index
    }
    
}
