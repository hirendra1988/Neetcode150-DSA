//
//  StackUsingQueue.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/09/25.
//

//https://leetcode.com/problems/implement-stack-using-queues/description/
//https://neetcode.io/problems/implement-stack-using-queues?list=neetcode250
class StackUsingQueue {
    
    init() {
       runTest()
    }
    
    func runTest() {
        let stack = MyStackUsingQueue()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        print(stack.top())
        print(stack.pop())
        print(stack.empty())
    }
    
}

class MyStackUsingQueue {

    var q1 = [Int]()
    var q2 = [Int]()
   
    init() {
        
    }
    
    func push(_ x: Int) {
        q2.append(x)
        while !q1.isEmpty {
            q2.append(q1.removeFirst())
        }
        (q1, q2) = (q2, q1)
    }
    
    func pop() -> Int {
        return q1.removeFirst()
    }
    
    func top() -> Int {
        return q1.first!
    }
    
    func empty() -> Bool {
        return q1.isEmpty
    }
}
