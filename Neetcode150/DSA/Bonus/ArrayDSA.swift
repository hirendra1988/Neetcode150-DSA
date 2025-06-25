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
        //        let people = [3,2,2,1], limit = 3
        //        //let people = [3,5,3,4], limit = 5
        //        let res = numRescueBoats(people, limit)
        //        print(res)
        
        let nums1 = [1,2,2,1], nums2 = [2,2]
        print(intersection(nums1, nums2))
    }
    
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var result = 0
        let people = people.sorted()
        var left = 0
        var right = people.count - 1
        while left <= right {
            if people[left] + people[right] <= limit {
                left += 1
            }
            right -= 1
            result += 1
        }
        return result
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
