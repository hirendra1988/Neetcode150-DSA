//
//  majorityElement.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/08/25.
//

//https://neetcode.io/problems/majority-element?list=neetcode250
//https://leetcode.com/problems/design-hashset/
//https://www.youtube.com/watch?v=wD7fs5P_MVo
class MajorityElement {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: nums = [2,2,1,1,1,2,2]
//        Output: 2
        let nums = [2,2,1,1,1,2,2]
        let res = majorityElement(nums)
        print(res)
    }

    func majorityElement(_ nums: [Int]) -> Int {
        var result = 0      // Stores the current candidate for majority element
        var count = 0       // Balance counter
        
        for num in nums {
            if count == 0 {
                // If no candidate, choose current number
                result = num
                count = 1
            } else if num == result {
                // If current number matches candidate, increase count
                count += 1
            } else {
                // Otherwise, decrease count (cancel out one occurrence)
                count -= 1
            }
        }
        return result
    }

    //Boyer–Moore Majority Vote Algorithm
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func majorityElement1(_ nums: [Int]) -> Int {
        var result = 0
        var count = 0
        for num in nums {
            if count == 0 {
                result = num
            }
            count += result == num ? 1 : -1
        }
        return result
    }
    
    //Boyer–Moore Majority Vote Algorithm
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func majorityElement3(_ nums: [Int]) -> Int {
        var majorityCandidate = nums[0]
        var votes = 1
        for i in 1..<nums.count {
            if votes == 0 {
                majorityCandidate = nums[i]
                votes = 1
            } else if majorityCandidate == nums[i] {
                votes += 1
            } else {
                votes -= 1
            }
        }
        return majorityCandidate
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func majorityElement2(_ nums: [Int]) -> Int {
        var hashMap = [Int: Int]()
        for num in nums {
            hashMap[num, default: 0] += 1
        }
        var maxCount = 0
        var majorityElement = 0
        for (key, value) in hashMap {
            if maxCount < value {
                maxCount = value
                majorityElement = key
            }
        }
        return majorityElement
    }
    
}
