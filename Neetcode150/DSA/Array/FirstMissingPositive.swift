//
//  FirstMissingPositive.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 17/05/26.
//

//https://leetcode.com/problems/first-missing-positive/

class FirstMissingPositive {
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,0]
        let result = firstMissingPositive(nums)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0
        var n = nums.count
        
        while i < n {
            let current = nums[i]
            let currentIndex = current - 1
            
            if current > 0, current <= n, nums[i] != nums[currentIndex] {
                let temp = nums[i]
                nums[i] = nums[currentIndex]
                nums[currentIndex] = temp
            } else {
                i += 1
            }
        }
        
        for i in 0..<n {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return n + 1
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func firstMissingPositive2(_ nums: [Int]) -> Int {
        var hashMap = [Int: Bool]()
        for num in nums {
            hashMap[num, default: false] = true
        }
        for i in 1...nums.count {
            if let key = hashMap[i], key {
                continue
            } else {
                return i
            }
        }
        return nums.count + 1
    }
}
