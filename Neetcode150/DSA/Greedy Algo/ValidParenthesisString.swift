//
//  ValidParenthesisString.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 21/02/25.
//

//https://leetcode.com/problems/valid-parenthesis-string/
//https://neetcode.io/problems/valid-parenthesis-string
//https://www.youtube.com/watch?v=lLXEV_3r66s
class ValidParenthesisString {
    
    init() {
//        Input: s = "(*))"
//        Output: true
        runTest()
    }
    
    func runTest() {
        let s = "(*))"
        let result = checkValidString(s)
        print(result)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func checkValidString(_ s: String) -> Bool {
        var s1 = [Int]()
        var s2 = [Int]()
        let sChars = Array(s)
        for i in 0..<sChars.count {
            if sChars[i] == "(" {
                s1.append(i)
            } else if sChars[i] == "*" {
                s2.append(i)
            } else {
                // closing bracket
                if !s1.isEmpty {
                    s1.popLast()
                } else if !s2.isEmpty {
                    s2.popLast()
                } else {
                    return false
                }
            }
        }
        
        while !s1.isEmpty {
            if s2.isEmpty {
                return false
            }
            let openIndex = s1.popLast() ?? 0
            let closeIndex = s2.popLast() ?? 0
            if openIndex < closeIndex {
                return false
            }
        }
        return s1.isEmpty
    }
    
}
