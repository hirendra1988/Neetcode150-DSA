//
//  BinaryTreeRightSideView.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 08/01/25.
//

//https://leetcode.com/problems/binary-tree-right-side-view/
//https://neetcode.io/problems/binary-tree-right-side-view
class BinaryTreeRightSideView {
    
    init() {
        //        Input: root = [3,9,20,null,null,15,7]
        //        Output: [[3],[9,20],[15,7]]
        runTest()
    }
    
    func runTest() {
        let root = createRootTree()
        let res = rightSideView(root)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = [Int]()
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let n = queue.count
            for i in 0..<n {
                let currentNode = queue.first
                if i == n - 1 {
                    result.append(currentNode!.val)
                }
                queue.removeFirst()
                if let left = currentNode?.left {
                    queue.append(left)
                }
                if let right = currentNode?.right {
                    queue.append(right)
                }
            }
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
