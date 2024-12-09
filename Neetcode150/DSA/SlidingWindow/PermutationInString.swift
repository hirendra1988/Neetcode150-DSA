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
        var i = 0
        var j = 0
        
        while i < s2CharArray.count, j < s2CharArray.count {
            if hashMap[s2CharArray[j]] != nil {
                hashMap[s2CharArray[j], default: 0] -= 1
                if hashMap[s2CharArray[j], default: 0] < 1 {
                    hashMap[s2CharArray[j]] = nil
                }
                if hashMap.isEmpty {
                    return true
                }
                j += 1
            } else if i < j {
                hashMap[s2CharArray[i], default: 0] += 1
                i += 1
            } else {
                i += 1
                j += 1
            }
        }
        
        return false
    }
}
