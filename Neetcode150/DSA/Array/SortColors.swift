//
//  SortColors.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 30/08/25.
//

//https://leetcode.com/problems/sort-colors/
//https://neetcode.io/problems/sort-colors?list=neetcode250
//https://www.youtube.com/watch?v=6sMssUHgaBs
class SortColors {
    
    init() {
        runTest()
    }
    
    func runTest() {
        var nums = [2,0,2,1,1,0]
        sortColors(&nums)
        print(nums)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func sortColors(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        var mid = 0
        while mid <= right {
            if nums[mid] == 0 {
                swap(mid, left, &nums)
                mid += 1
                left += 1
            } else if nums[mid] == 1 {
                mid += 1
            } else {
                swap(mid, right, &nums)
                right -= 1
            }
        }
    }
    
    func swap(_ x: Int, _ y: Int, _ nums: inout [Int]) {
        let temp = nums[x]
        nums[x] = nums[y]
        nums[y] = temp
    }
    
    //Time Complexity: O(n^2) || Space Compelxity: O(1)
    // Buuble sort
    func sortColors2(_ nums: inout [Int]) {
        var isSwapped = false
        for i in 0..<nums.count - 1 {
            for j in 0..<nums.count - 1 - i {
                if nums[j] > nums[j+1] {
                    let temp = nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = temp
                    isSwapped = true
                }
            }
            if !isSwapped {
                break
            }
        }
    }
    
}
