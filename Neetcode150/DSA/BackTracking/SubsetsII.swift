//
//  SubsetsII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/03/25.
//

//https://leetcode.com/problems/subsets-ii/
//https://neetcode.io/problems/subsets-ii
//https://www.youtube.com/watch?v=qGyyzpNlMDU
class SubsetsII {
    
    init() {
        //        Input: nums = [1,2,2]
        //        Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,2]
        let res = subsetsWithDup(nums)
        print(res)
    }
    
    //Time Complexity: O(2^n * nlogn) || Space Compelxity: O(2^n * n)
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        let sortedNums = nums.sorted()
        backTracking(sortedNums, &result, &tempSet, 0)
        return result
    }
    
    func backTracking(_ nums: [Int],
                      _ result: inout [[Int]],
                      _ tempSet: inout [Int],
                      _ startIndex: Int) {
        if !result.contains(tempSet) {
            result.append(tempSet)
        }
        for i in startIndex..<nums.count {
            tempSet.append(nums[i])
            backTracking(nums, &result, &tempSet, i+1)
            tempSet.removeLast()
        }
    }
    
    func backTracking2(_ nums: [Int],
                       _ result: inout [[Int]],
                       _ tempSet: inout [Int],
                       _ startIndex: Int) {
        result.append(tempSet)
        for i in startIndex..<nums.count {
            if i > startIndex, nums[i] == nums[i-1] {
                continue
            }
            tempSet.append(nums[i])
            backTracking(nums, &result, &tempSet, i+1)
            tempSet.removeLast()
        }
    }
    
    func subsetsWithDup3(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let sortedNums = nums.sorted()
        backTracking3(sortedNums, &result, [], 0)
        return result
    }
    
    func backTracking3(_ nums: [Int],
                       _ result: inout [[Int]],
                       _ tempSet: [Int],
                       _ startIndex: Int) {
        result.append(tempSet)
        for i in startIndex..<nums.count {
            if i > startIndex, nums[i] == nums[i-1] {
                continue
            }
            var tempSet = tempSet
            tempSet.append(nums[i])
            backTracking3(nums, &result, tempSet, i+1)
            //tempSet.removeLast()
        }
    }
    
}
