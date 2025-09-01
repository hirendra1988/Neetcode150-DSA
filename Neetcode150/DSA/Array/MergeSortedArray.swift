//
//  MergeSortedArray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 01/09/25.
//

//https://leetcode.com/problems/merge-sorted-array/
//https://neetcode.io/problems/merge-sorted-array?list=neetcode250
class MergeSortedArray {
    
    init() {
        runTest()
    }
    
    func runTest() {
        var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
        merge(&nums1, m, nums2, n)
        print(nums1)
    }
    
    // Time Complexity: O(m+n) || Space Compelxity: O(1)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m-1
        var p2 = n-1
        var p = m + n - 1
        
        while p1 >= 0, p2 >= 0 {
            if nums1[p1] >= nums2[p2] {
                nums1[p] = nums1[p1]
                p1 -= 1
            } else if nums1[p1] < nums2[p2] {
                nums1[p] = nums2[p2]
                p2 -= 1
            }
            p -= 1
        }
        while p2 >= 0 {
            nums1[p] = nums2[p2]
            p2 -= 1
            p -= 1
        }
    }
    
}
