//
//  ValidAnagram.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/12/24.
//

//https://neetcode.io/problems/is-anagram
//https://leetcode.com/problems/valid-anagram/
class ValidAnagram {
    
    init() {
        runTest()
    }

    func runTest() {
        let s = "anagram"
        let t = "nagaram"
        let result = isAnagram(s, t)
        print(result)
    }
    
    // Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.sorted() == t.sorted() {
            return true
        }
        return false
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    //So, the Space Complexity = O(1) (because 26 is constant).
    func isAnagram2(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var hashMap = [Character: Int]()
        for char in s {
            hashMap[char, default: 0] += 1
        }
        
        for char in t {
            if let count = hashMap[char], count > 0 {
                hashMap[char]! -= 1
            } else {
                return false
            }
        }
        return true
    }
}
