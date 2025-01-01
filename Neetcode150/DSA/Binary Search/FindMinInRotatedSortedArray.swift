//
//  FindMinInRotatedSortedArray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/12/24.
//

//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
//https://neetcode.io/problems/find-minimum-in-rotated-sorted-array
class FindMinInRotatedSortedArray {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [3,4,5,1,2]
        let res = findMin(nums)
        print(res)
    }
    
    // Time Complexity: O(logn) || Space Compelxity: O(1)
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        var res = Int.max
        while left <= right {
            let mid = (left + right)/2
            if nums[left] <= nums[mid] {
                res = min(res, nums[left])
                left = mid + 1
            } else {
                res = min(res, nums[mid])
                right = mid - 1
            }
        }
        return res
    }
    
    // Time Complexity: O(logn) || Space Compelxity: O(1)
    func findMin1(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let mid = (left + right)/2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return nums[left]
        //return nums[right]
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func findMin2(_ nums: [Int]) -> Int {
        var res = nums[0]
        for i in 1..<nums.count {
            if nums[i] < nums[i-1] {
                res = nums[i]
                break
            }
        }
        return res
    }
    
}
