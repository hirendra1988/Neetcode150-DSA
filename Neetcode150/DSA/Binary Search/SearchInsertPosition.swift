//
//  SearchInsertPosition.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 14/09/25.
//

//https://leetcode.com/problems/search-insert-position/description/
//https://neetcode.io/problems/search-insert-position?list=neetcode250
class SearchInsertPosition {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [1,3,5,6], target = 5
        print(searchInsert(nums, target))
    }
    
    // Time Complexity: O(logn) || Space Compelxity: O(1)
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            }
            if target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
}
