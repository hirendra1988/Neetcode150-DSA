//
//  MedianOfTwoSortedArrays.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/12/24.
//

//https://leetcode.com/problems/median-of-two-sorted-arrays/
//https://neetcode.io/problems/median-of-two-sorted-arrays
//https://www.youtube.com/watch?v=2BOgAlmyTkc
class MedianOfTwoSortedArrays {
    
    init() {
        runTest()
    }
    
    func runTest() {
        //let nums1 = [1,3], nums2 = [2]
        let nums1 = [1,2,3,4,5], nums2 = [3,4,5,6,7,8]
        let res = findMedianSortedArrays(nums1, nums2)
        print(res)
    }
    
    // Time Complexity: O(log(min(m,n)) || Space Compelxity: O(1)
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count == 0 {
            return medianHelper(nums2)
        } else if nums2.count == 0 {
            return medianHelper(nums1)
        }
        let n = nums1.count
        let m = nums2.count
        var left = 0
        var right = n
        
        if n > m {
            return findMedianSortedArrays(nums2, nums1)
        }
        let N = (m+n)/2
        
        while left <= right {
            //mid -> cut1
            let cut1 = (left + right)/2
            let cut2 = N - cut1
            
            let l1 = (cut1 == 0) ? Int.min : nums1[cut1-1]
            let l2 = (cut2 == 0) ? Int.min : nums2[cut2-1]
            
            let r1 = (cut1 == n) ? Int.max : nums1[cut1]
            let r2 = (cut2 == m) ? Int.max : nums2[cut2]
            
            if l1 <= r2 && l2 <= r1 {
                if (m+n) % 2 == 0 {
                    return (Double(max(l1,l2) + min(r1,r2))) / 2.0
                }
                return Double(min(r1,r2))
            } else if l1 > r2 {
                right = cut1 - 1
            } else {
                left = cut1 + 1
            }
        }
        return 0.0
    }
    
    func medianHelper(_ nums: [Int]) -> Double {
        let n = nums.count / 2
        if nums.count % 2 == 0 {
            return (Double(nums[n] + nums[n-1])) / 2
        }
        return Double(nums[n])
    }
    
    // Time Complexity: O((m+n)log(m+n) || Space Compelxity: O(m+n)
    func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let mergedSortedArray = (nums1 + nums2).sorted()
        var result: Double = 0.0
        var slow = 0
        var fast = 0
        if mergedSortedArray.count % 2 == 0 {
            let val1 = Double(mergedSortedArray[mergedSortedArray.count / 2])
            let val2 = Double(mergedSortedArray[(mergedSortedArray.count / 2) - 1])
            result = (val1 + val2)/2
        } else {
            while fast <= mergedSortedArray.count {
                slow += 1
                fast += 2
            }
            result = Double(mergedSortedArray[slow - 1])
        }
        return result
    }
    
    func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let mergedSortedArray = (nums1 + nums2).sorted()
        let n = mergedSortedArray.count
        
        if n % 2 == 0 {
            let mid1 = mergedSortedArray[n / 2]
            let mid2 = mergedSortedArray[n / 2 - 1]
            return (Double(mid1) + Double(mid2)) / 2
        } else {
            return Double(mergedSortedArray[n / 2])
        }
    }
    
}
