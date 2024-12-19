//
//  MinStack.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 19/12/24.
//

//https://leetcode.com/problems/min-stack/
//https://neetcode.io/problems/minimum-stack
class MinStack {
    
    var minStack = [(value: Int, minValue: Int)]()
    
    init() {
        runTest()
    }
    
    //Time Complexity: O(1) || Space Compelxity: O(n)
    func runTest() {
        push(-2)
        push(0)
        push(-3)
        print(getMin())
        pop()
        print(top())
        print(getMin())
    }
    
    func push(_ val: Int) {
        if let lastValue = minStack.last {
            let minVal = min(lastValue.minValue, val)
            minStack.append((value: val, minValue: minVal))
        } else {
            minStack.append((value: val, minValue: val))
        }
    }
    
    func pop() {
        minStack.popLast()
    }
    
    func top() -> Int {
        return minStack.last?.value ?? 0
    }
    
    func getMin() -> Int {
        return minStack.last?.minValue ?? 0
    }
    
}
