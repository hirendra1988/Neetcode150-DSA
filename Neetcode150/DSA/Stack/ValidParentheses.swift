//
//  ValidParentheses.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 19/12/24.
//

//https://leetcode.com/problems/valid-parentheses/
//https://neetcode.io/problems/validate-parentheses
class ValidParentheses {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s = "()[]{}" // Output: true
        let res = isValid(s)
        print(res)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let charArray = Array(s)
        for char in charArray {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if stack.isEmpty {
                    return false
                }
                if (stack.last! == "(" && char == ")") || (stack.last! == "{" && char == "}")
                    || (stack.last! == "[" && char == "]") {
                    stack.popLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
    
}
