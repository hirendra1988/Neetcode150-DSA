//
//  LongestConsecutiveSequence.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/12/24.
//

//https://leetcode.com/problems/longest-consecutive-sequence/
//https://neetcode.io/problems/longest-consecutive-sequence
class LongestConsecutiveSequence {
    
    init() {
        runTest()
    }
    
    //Output: 4
    func runTest() {
        //[9,1,4,7,3,-1,0,5,8,-1,6]
        let nums = [100,4,200,1,3,2]//[0,3,7,2,5,8,4,6,0,1]
        let result = longestConsecutive(nums)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    // In worst case Time Complexity: O(n^2)
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        let setNums = Set(nums)
        var largest = 1
        for num in setNums {
            if !setNums.contains(num-1) {
                var count = 1
                var currentNum = 1
                while setNums.contains(num+currentNum) {
                    count += 1
                    currentNum += 1
                }
                largest = max(largest, count)
            }
        }
        return largest
    }
    
    // Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func longestConsecutive2(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        let sortedNums = nums.sorted()
        var count = 1
        var maxCount = 0
        for i in 0..<sortedNums.count - 1 {
            if sortedNums[i] == sortedNums[i+1] {
                continue
            }
            if (sortedNums[i] + 1) == sortedNums[i+1] {
                count += 1
            } else {
                maxCount = max(maxCount, count)
                count = 1
            }
        }
        maxCount = max(maxCount, count)
        return maxCount
    }
    
}
