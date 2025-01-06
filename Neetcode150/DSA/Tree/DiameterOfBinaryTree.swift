//
//  DiameterOfBinaryTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/01/25.
//

//https://leetcode.com/problems/diameter-of-binary-tree/
//https://neetcode.io/problems/binary-tree-diameter
class DiameterOfBinaryTree {
    
    class TreeNode {
        var left: TreeNode?
        var right: TreeNode?
        var val: Int
        init(_ val: Int) {
            self.val = val
        }
    }
    
    init() {
//        Input: root = [1,2,3,4,5]
//        Output: 3
//        Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
        runTest()
    }
    
    func runTest() {
        let root = createRootTree()
        displayLevelOrder(root: root)
        let res = diameterOfBinaryTree(root)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n) // O(logn) for a balanced binary tree
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        _ = diameterOfBinaryTreeHelper(root, &diameter)
        return diameter
    }
    
    func diameterOfBinaryTreeHelper(_ root: TreeNode?, _ diameter: inout Int) -> Int {
        guard let root = root else { return 0 }
        let left = diameterOfBinaryTreeHelper(root.left, &diameter)
        let right = diameterOfBinaryTreeHelper(root.right, &diameter)
        diameter = max(left + right, diameter)
        return max(left, right) + 1
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(1)
        let n2 = TreeNode(2)
        let n3 = TreeNode(3)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(4)
        let n5 = TreeNode(5)
        n2.left = n4
        n2.right = n5

        return n1
    }
    
    func displayLevelOrder(root: TreeNode?) {
        guard let root = root else { return }
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            let n = queue.count
            for _ in 0..<n {
                let firstNode = queue.first
                print(firstNode!.val, terminator: " -> ")
                queue.removeFirst()
                
                if let left = firstNode?.left {
                    queue.append(left)
                }
                
                if let right = firstNode?.right {
                    queue.append(right)
                }
            }
            print("")
        }
    }
    
}
