//
//  BinaryTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 23/01/25.
//

class BinaryTree {
    
    class Node {
        var left: Node?
        var right: Node?
        var val: Int
        
        init(val: Int) {
            self.val = val
        }
    }
    
    init() {
        runTest()
    }
    
    func runTest() {
        let root = createRootBT()
        //displayLevel(node: root)
        
        let res = isSumTree(node: root)
        print(res)
    }
    
    //https://www.geeksforgeeks.org/problems/sum-tree/1
    func isSumTree(node: Node) -> Bool {
        var isSumTree = true
        _ = isSumTreeHelper(node: node, isSumTree: &isSumTree)
        return isSumTree
    }
    
    func isSumTreeHelper(node: Node?, isSumTree: inout Bool) -> Int {
        guard let node = node else { return 0 }
        let left = isSumTreeHelper(node: node.left, isSumTree: &isSumTree)
        let right = isSumTreeHelper(node: node.right, isSumTree: &isSumTree)

        if left + right == 0 {
            return node.val
        }
        
        if (left + right) != node.val {
            isSumTree = false
        }
        return node.val + left + right
    }
    
    func createRootBT() -> Node {
        let n1 = Node(val: 70)
        let n2 = Node(val: 20)
        let n3 = Node(val: 30)
        n1.left = n2
        n1.right = n3
        
        let n4 = Node(val: 10)
        let n5 = Node(val: 10)
        n2.left = n4
        n2.right = n5
        
        return n1
    }
    
    func displayLevel(node: Node?) {
        var queue = [Node]()
        queue.append(node!)
        while !queue.isEmpty {
            let n = queue.count
            for _ in 0..<n {
                let current = queue.removeFirst()
                print(current.val, terminator: " -> ")
                if let left = current.left {
                    queue.append(left)
                }
                if let right = current.right {
                    queue.append(right)
                }
            }
            print("")
        }
    }
    
}
