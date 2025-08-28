//
//  SortArray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 28/08/25.
//

//https://leetcode.com/problems/sort-an-array/description/
//https://neetcode.io/problems/sort-an-array?list=neetcode250
class SortArray {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [5,2,3,1]
        print(sortArray(nums))
    }
    
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        var nums = nums
        mergeSort(&nums, 0, nums.count - 1)
        return nums
    }
    
    func mergeSort(_ nums: inout [Int], _ startIndex: Int, _ endIndex: Int) {
        if startIndex >= endIndex {
            return
        }
        let mid = (startIndex + endIndex) / 2
        mergeSort(&nums, startIndex, mid)
        mergeSort(&nums, mid+1, endIndex)
        merge(&nums, startIndex, mid, endIndex)
    }
    
    func merge(_ nums: inout [Int], _ startIndex: Int, _ mid: Int, _ endIndex: Int) {
        var i = startIndex
        var j = mid + 1
        var k = startIndex
        var tempArray = [Int](repeating: -1, count: nums.count)
        while i <= mid && j <= endIndex {
            if nums[i] < nums[j] {
                tempArray[k] = nums[i]
                i += 1
            } else {
                tempArray[k] = nums[j]
                j += 1
            }
            k += 1
        }
        
        while i <= mid {
            tempArray[k] = nums[i]
            i += 1
            k += 1
        }
        while j <= endIndex {
            tempArray[k] = nums[j]
            j += 1
            k += 1
        }
        for i in startIndex...endIndex {
            nums[i] = tempArray[i]
        }
    }
}
