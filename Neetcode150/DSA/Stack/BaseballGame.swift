//
//  BaseballGame.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/09/25.
//

//https://leetcode.com/problems/baseball-game/description/
//https://neetcode.io/problems/baseball-game?list=neetcode250
class BaseballGame {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let operations = ["5","-2","4","C","D","9","+","+"]
        print(calPoints(operations))
    }
    
    func calPoints(_ operations: [String]) -> Int {
        var stack = [Int]()
        for operation in operations {
            if let digit = Int(operation) {
                stack.append(digit)
                continue
            }
            switch operation {
            case "C":
                stack.popLast()
            case "D":
                if let last = stack.last {
                    stack.append(2*last)
                }
            case "+":
                if stack.count >= 2 {
                    let last = stack[stack.count - 1]
                    let secondLast = stack[stack.count - 2]
                    stack.append(last + secondLast)
                }
            default:
                break
            }
        }
        
        return stack.reduce(0,+)
    }
}
