//
//  InvertBinaryTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/01/25.
//

//https://leetcode.com/problems/invert-binary-tree/
//https://neetcode.io/problems/invert-a-binary-tree
class InvertBinaryTree {
    
    class TreeNode {
        var left: TreeNode?
        var right: TreeNode?
        var val: Int
        init(_ val: Int) {
            self.val = val
        }
    }
    
    init() {
//        Input: root = [4,2,7,1,3,6,9]
//        Output: [4,7,2,9,6,3,1]
        runTest()
    }
    
    func runTest() {
        let root = createRootTree()
        displayLevelOrder(root: root)
        let res = invertTree(root)
        displayLevelOrder(root: res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        (root.left, root.right) = (root.right, root.left)
        _ = invertTree(root.left)
        _ = invertTree(root.right)
        return root
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(4)
        let n2 = TreeNode(2)
        let n3 = TreeNode(7)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(1)
        let n5 = TreeNode(3)
        n2.left = n4
        n2.right = n5
        
        let n6 = TreeNode(6)
        let n7 = TreeNode(9)
        n3.left = n6
        n3.right = n7
        
        return n1
    }
    
    // using preorder
    func displayPreorder(root: TreeNode?) {
        if root != nil {
            print(root!.val, terminator: " -> ")
            displayPreorder(root: root?.left)
            displayPreorder(root: root?.right)
        }
    }
    
    //[4,2,7,1,3,6,9]
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
