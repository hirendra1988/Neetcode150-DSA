//
//  BinarySearch.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 23/12/24.
//

//https://leetcode.com/problems/binary-search/
//https://neetcode.io/problems/binary-search
class BinarySearch {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [-1,0,3,5,9,12], target = 9
        //Output: 4
        let res = search(nums, target)
        print(res)
    }
    
    // Time Complexity: O(logn) || Space Compelxity: O(1)
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right)/2
            if nums[mid] == target {
                return mid
            }
            if nums[left] == target {
                return left
            }
            if nums[right] == target {
                return right
            }
            
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
    
}
