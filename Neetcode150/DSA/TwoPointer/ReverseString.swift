//
//  ReverseString.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 01/11/25.
//

//https://leetcode.com/problems/reverse-string/
//https://neetcode.io/problems/reverse-string?list=neetcode250
class ReverseString {
    
    init() {
        runTest()
    }
    
    func runTest() {
        var s: [Character] = ["h","e","l","l","o"]
        reverseString(&s)
        print(s)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1
        while left < right {
            let temp = s[left]
            s[left] = s[right]
            s[right] = temp
            left += 1
            right -= 1
        }
    }
    
}
