//
//  SearchInRotatedSortedArray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/12/24.
//

//https://leetcode.com/problems/search-in-rotated-sorted-array/
//https://neetcode.io/problems/find-target-in-rotated-sorted-array
class SearchInRotatedSortedArray {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [4,5,6,7,0,1,2], target = 0
        let res = search(nums, target)
        print(res)
    }
    
    // Time Complexity: O(logn) || Space Compelxity: O(1)
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right)/2
            if nums[mid] == target { return mid }
            if nums[left] == target { return left }
            if nums[right] == target { return right }
            
            if nums[left] < nums[mid] {
                if target >= nums[left] && target <= nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else if nums[left] > nums[mid] {
                if target <= nums[right] && target >= nums[mid] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                left = mid + 1
            }
        }
        return -1
    }
    
}
