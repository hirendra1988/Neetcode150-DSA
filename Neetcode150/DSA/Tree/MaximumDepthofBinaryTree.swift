//
//  MaximumDepthofBinaryTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/01/25.
//

//https://leetcode.com/problems/maximum-depth-of-binary-tree/
//https://neetcode.io/problems/depth-of-binary-tree
class MaximumDepthofBinaryTree {
    
    init() {
//        Input: root = [3,9,20,null,null,15,7]
//        Output: 3
        runTest()
    }
    
    func runTest() {
        let root = createRootTree()
        displayLevelOrder(root: root)
        let res = maxDepth(root)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n) // O(logn) for a balanced binary tree
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = maxDepth(root.left)
        let right = maxDepth(root.right)
        return max(left, right) + 1
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(3)
        let n2 = TreeNode(9)
        let n3 = TreeNode(20)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(15)
        let n5 = TreeNode(17)
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
