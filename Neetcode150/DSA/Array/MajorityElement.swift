//
//  majorityElement.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/08/25.
//

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
    
    //Boyer–Moore Majority Vote Algorithm
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func majorityElement(_ nums: [Int]) -> Int {
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
