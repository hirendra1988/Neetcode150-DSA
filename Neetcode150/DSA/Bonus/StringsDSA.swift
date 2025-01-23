//
//  StringsDSA.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/12/24.
//

class StringsDSA {
    
    init() {
        runTest()
    }
    
    func runTest() {
        //let inputStr = "this-is a test_case"
        // output: thisIsATestCase
        let inputStr = "a b c d-e-f%g"
        // output: aBCDEFG
        let result = camelCaseDSAProblem(input: inputStr)
        print(result)
        
        let res = longestPalindrome("babad")
        print(res)
    }
    
    func camelCaseDSAProblem(input: String) -> String {
        var foundSpecialChar = false
        var result = ""
        
        for char in input {
            if char.isLetter {
                if foundSpecialChar {
                    result.append(char.uppercased())
                    foundSpecialChar = false
                } else {
                    result.append(char.lowercased())
                }
            } else {
                foundSpecialChar = true
            }
        }
        
        return result
    }
    
    //https://leetcode.com/problems/longest-palindromic-substring/
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var result = ""
        var resultLength = Int.min
        for i in 0..<chars.count {
            // Check for odd-length palindromes
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
            // Check for even-length palindromes
            left = i
            right = i + 1
            while left >= 0, right < chars.count{
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
