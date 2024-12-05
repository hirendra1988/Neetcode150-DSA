//
//  ValidPalindrome.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/12/24.
//

//https://leetcode.com/problems/valid-palindrome/
//https://neetcode.io/problems/is-palindrome
class ValidPalindrome {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s = "A man, a plan, a canal: Panama"
        let result = isPalindrome(s)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func isPalindrome(_ s: String) -> Bool {
        let charArray = Array(s.lowercased())
        var left = 0
        var right = charArray.count - 1
        while left < right {
            if !charArray[left].isLetter && !charArray[left].isNumber {
                left += 1
                continue
            }
            if !charArray[right].isLetter && !charArray[right].isNumber {
                right -= 1
                continue
            }
            if charArray[left] != charArray[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func isPalindrome2(_ s: String) -> Bool {
        let input = s.filter { $0.isLetter || $0.isNumber }.lowercased()
        if input.isEmpty {
            return true
        }
        let charArray = Array(input)
        var left = 0
        var right = charArray.count - 1
        while left < right {
            if charArray[left] != charArray[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
}
