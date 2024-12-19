//
//  EvaluateRPN.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 19/12/24.
//

//https://neetcode.io/problems/evaluate-reverse-polish-notation
//https://leetcode.com/problems/evaluate-reverse-polish-notation/description/
class EvaluateRPN {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"] // Output: 22
        let res = evalRPN(tokens)
        print(res)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            if let val = Int(token) {
                stack.append(val)
                continue
            }
            let val1 = stack.popLast() ?? 0
            let val2 = stack.popLast() ?? 0
            switch token {
            case "+":
                stack.append(val2 + val1)
            case "-":
                stack.append(val2 - val1)
            case "/":
                stack.append(val2 / val1)
            case "*":
                stack.append(val1 * val2)
            default:
                break
            }
        }
        return stack.last ?? 0
    }
    
}
