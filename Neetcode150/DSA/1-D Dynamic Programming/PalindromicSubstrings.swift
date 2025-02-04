//
//  PalindromicSubstrings.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/02/25.
//

//https://leetcode.com/problems/palindromic-substrings/
//https://neetcode.io/problems/palindromic-substrings
class PalindromicSubstrings {
    
    init() {
//        Input: s = "abc"
//        Output: 3
//        Explanation: Three palindromic strings: "a", "b", "c".
        runTest()
    }
    
    func runTest() {
        let s = "abc"
        let res = countSubstrings(s)
        print(res)
    }
    
    //Time Complexity: O(n^2) || Space Compelxity: O(1)
    func countSubstrings(_ s: String) -> Int {
        var sChars = Array(s)
        var result = 0
        for i in 0..<sChars.count {
            // Odd
            var left = i
            var right = i
            while left >= 0, right < sChars.count {
                if sChars[left] != sChars[right] {
                    break
                }
                left -= 1
                right += 1
                result += 1
            }
            
            // Even
            left = i
            right = i+1
            while left >= 0, right < sChars.count {
                if sChars[left] != sChars[right] {
                    break
                }
                left -= 1
                right += 1
                result += 1
            }
        }
        return result
    }
    
}
