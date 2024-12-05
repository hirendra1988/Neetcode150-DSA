//
//  ContainsDuplicate.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/12/24.
//

//https://neetcode.io/problems/duplicate-integer
//https://leetcode.com/problems/contains-duplicate/description/

class ContainsDuplicate {
    
    init() {
        runTest()
    }
    
    private func runTest() {
        let array = [1,2,3,1]
        let result = containsDuplicate(array)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    private func containsDuplicate(_ nums: [Int]) -> Bool {
        var hashMap = [Int: Int]()
        for num in nums {
            hashMap[num, default: 0] += 1
            if hashMap[num] ?? 0 > 1 {
                return true
            }
        }
        return false
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    private func containsDuplicate2(_ nums: [Int]) -> Bool {
        var result = Set<Int>()
        for num in nums {
            if result.contains(num) {
                return true
            }
            result.insert(num)
        }
        return false
    }
    
}
