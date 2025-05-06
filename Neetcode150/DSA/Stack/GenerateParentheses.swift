//
//  GenerateParentheses.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 20/12/24.
//

//https://leetcode.com/problems/generate-parentheses/
//https://neetcode.io/problems/generate-parentheses
class GenerateParentheses {
    init() {
        runTest()
    }
    
    func runTest() {
        let n = 3
        let res = generateParenthesis(n)
        //Output: ["((()))","(()())","(())()","()(())","()()()"]
        print(res)
    }
    
    // Time Complexity: O(4^n/sqrt(n)) || Space Compelxity: O(C_n * n)
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        generate(cur: "", open: n, close: n, result: &result)
        return result
    }
    
    func generate(cur: String, open: Int, close: Int, result: inout [String]) {
        if open == 0 && close == 0 {
            result.append(cur)
            return
        }
        if open > 0 {
            generate(cur: cur + "(", open: open - 1, close: close, result: &result)
        }
        if close > open {
            generate(cur: cur + ")", open: open, close: close-1, result: &result)
        }
    }
    
}
