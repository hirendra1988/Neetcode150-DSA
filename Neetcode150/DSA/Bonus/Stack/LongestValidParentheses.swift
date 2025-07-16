//
//  Untitled.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/07/25.
//

//https://leetcode.com/problems/longest-valid-parentheses/description/
class LongestValidParentheses {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s = ")()())"
        let res = longestValidParentheses(s)
        print(res)
        //Output: 4
    }
    
    func longestValidParentheses(_ s: String) -> Int {
        var sChars = Array(s)
        var stack = [Int]()
        stack.append(-1)
        var result = 0
        for i in 0..<sChars.count {
            if sChars[i] == "(" {
                stack.append(i)
            } else {
                stack.popLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    result = max(result, i - stack.last!)
                }
            }
        }
        return result
    }
    
}
