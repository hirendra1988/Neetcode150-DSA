//
//  ArrayDSA.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 21/03/25.
//

class ArrayDSA {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums1 = [1,2,2,1], nums2 = [2,2]
        print(intersection(nums1, nums2))
    }
    
    //    Input: nums1 = [1,2,2,1], nums2 = [2,2]
    //    Output: [2]
    //    Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
    //    Output: [9,4]
    //    Explanation: [4,9] is also accepted.
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let sortedNums1 = nums1.sorted()
        let sortedNums2 = nums2.sorted()
        var resultSet = Set<Int>()
        var index1 = 0
        var index2 = 0
        while index1 < sortedNums1.count && index2 < sortedNums2.count {
            if sortedNums1[index1] == sortedNums2[index2] {
                resultSet.insert(sortedNums1[index1])
                index1 += 1
                index2 += 1
            } else if sortedNums1[index1] < sortedNums2[index2] {
                index1 += 1
            } else {
                index2 += 1
            }
        }
        return Array(resultSet)
    }
    
}
