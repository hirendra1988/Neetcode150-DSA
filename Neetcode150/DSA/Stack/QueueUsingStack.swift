//
//  QueueUsingStack.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/09/25.
//

//https://leetcode.com/problems/implement-queue-using-stacks/description/
//https://neetcode.io/problems/implement-queue-using-stacks?list=neetcode250
class QueueUsingStack {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let queue = MyQueueUsingStack()
        queue.push(1)
        queue.push(2)
        print(queue.peek())
        print(queue.pop())
        print(queue.empty())
    }
    
}

//Time Complexity: O(1) || Space Compelxity: O(n)
class MyQueueUsingStack {

    var s1 = [Int]()
    var s2 = [Int]()

    init() {
        
    }
    
    func push(_ x: Int) {
        s1.append(x)
    }
    
    func pop() -> Int {
        _ = peek()
        return s2.removeLast()
    }
    
    func peek() -> Int {
        if s2.isEmpty {
            while !s1.isEmpty {
                s2.append(s1.removeLast())
            }
        }
        return s2.last!
    }
    
    func empty() -> Bool {
        return s1.isEmpty && s2.isEmpty
    }
}
