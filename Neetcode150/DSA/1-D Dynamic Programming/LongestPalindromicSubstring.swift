//
//  LongestPalindromicSubstring.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/02/25.
//

//https://leetcode.com/problems/longest-palindromic-substring/
//https://neetcode.io/problems/longest-palindromic-substring
class LongestPalindromicSubstring {
    
    init() {
        //        Input: s = "babad"
        //        Output: "bab"
        //        Explanation: "aba" is also a valid answer.
        runTest()
    }
    
    func runTest() {
        let s = "babad"
        let res = longestPalindrome(s)
        print(res)
    }
    
    //Time Complexity: O(n^2) || Space Compelxity: O(1)
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var result = ""
        var resultLength = 0
        for i in 0..<chars.count {
            // Odd Length
            var left = i
            var right = i
            
            while left >= 0, right < chars.count {
                if chars[left] != chars[right] {
                    break
                }
                if (right - left + 1) > resultLength {
                    resultLength = right - left + 1
                    result = String(chars[left...right])
                }
                left -= 1
                right += 1
            }
            // Even Length
            left = i
            right = i + 1
            while left >= 0, right < chars.count {
                if chars[left] != chars[right] {
                    break
                }
                if (right - left + 1) > resultLength {
                    resultLength = right - left + 1
                    result = String(chars[left...right])
                }
                left -= 1
                right += 1
            }
        }
        return result
    }
}
