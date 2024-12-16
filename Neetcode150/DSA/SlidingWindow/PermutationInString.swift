//
//  PermutationInString.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 08/12/24.
//

//https://leetcode.com/problems/permutation-in-string/
//https://neetcode.io/problems/permutation-string
class PermutationInString {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s1 = "ab", s2 = "eidboaoo"
        let result = checkInclusion(s1, s2)
        print(result)
    }
    
    //Time Complexity: O(n) where n is the length of s2
    //Space Compelxity: O(k) where k is the length of s1 (size of map)
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {
            return false
        }
        
        var hashMap = [Character: Int]()
        let s1CharArray = Array(s1)
        let s2CharArray = Array(s2)
        
        for char in s1CharArray {
            hashMap[char, default: 0] += 1
        }
        var left = 0
        var right = 0
        
        while left < s2CharArray.count, right < s2CharArray.count {
            if hashMap[s2CharArray[right]] != nil {
                hashMap[s2CharArray[right], default: 0] -= 1
                if hashMap[s2CharArray[right], default: 0] < 1 {
                    hashMap[s2CharArray[right]] = nil
                }
                if hashMap.isEmpty {
                    return true
                }
                right += 1
            } else if left < right {
                hashMap[s2CharArray[left], default: 0] += 1
                left += 1
            } else {
                left += 1
                right += 1
            }
        }
        
        return false
    }
}
