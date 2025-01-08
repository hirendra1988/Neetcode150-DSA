//
//  BinaryTreeLevelOrder.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 08/01/25.
//

//https://leetcode.com/problems/binary-tree-level-order-traversal/
//https://neetcode.io/problems/level-order-traversal-of-binary-tree
class BinaryTreeLevelOrder {
    
    init() {
        //        Input: root = [3,9,20,null,null,15,7]
        //        Output: [[3],[9,20],[15,7]]
        runTest()
    }
    
    func runTest() {
        let root = createRootTree()
        let res = levelOrder(root)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        
        while !queue.isEmpty {
            let n = queue.count
            var tempArr = [Int]()
            for _ in 0..<n {
                let firstNode = queue.first
                tempArr.append(firstNode?.val ?? 0)
                queue.removeFirst()
                
                if let left = firstNode?.left {
                    queue.append(left)
                }
                if let right = firstNode?.right {
                    queue.append(right)
                }
            }
            result.append(tempArr)
        }
        return result
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(3)
        let n2 = TreeNode(9)
        let n3 = TreeNode(20)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(15)
        let n5 = TreeNode(7)
        n3.left = n4
        n3.right = n5
        
        return n1
    }
    
}
