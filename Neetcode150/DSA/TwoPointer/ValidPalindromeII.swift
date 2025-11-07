//
//  ValidPalindromeII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 14/09/25.
//

//https://neetcode.io/problems/valid-palindrome-ii?list=neetcode250
//https://leetcode.com/problems/valid-palindrome-ii/
class ValidPalindromeII {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s = "abca"
        print(validPalindrome(s))
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func validPalindrome(_ s: String) -> Bool {
        var left = 0
        var right = s.count - 1
        let sChars = Array(s)
        while left < right {
            if sChars[left] != sChars[right] {
                return validPalindromeHelper(sChars, left+1, right) || validPalindromeHelper(sChars, left, right - 1)
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    func validPalindromeHelper(_ sChars: [Character], _ left: Int, _ right: Int) -> Bool {
        var left = left
        var right = right
        while left <= right {
            if sChars[left] != sChars[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    // Time Complexity: O(n^2) || Space Compelxity: O(n)
    func validPalindrome2(_ s: String) -> Bool {
        if validPalindromeHelper(s) {
            return true
        }
        let sChars = Array(s)
        for i in 0..<sChars.count {
            let str1 = String(sChars[0..<i])
            let str2 = String(sChars[i+1..<sChars.count])
            let finalStr = str1 + str2
            if validPalindromeHelper(finalStr) {
                return true
            }
        }
        return false
    }
    
    func validPalindromeHelper(_ s: String) -> Bool {
        let sChars = Array(s)
        var left = 0
        var right = sChars.count - 1
        while left <= right {
            if sChars[left] != sChars[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
}
