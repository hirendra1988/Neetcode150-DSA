//
//  ConstructBT.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/01/25.
//

//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
//https://neetcode.io/problems/binary-tree-from-preorder-and-inorder-traversal
class ConstructBT {
    
    init() {
        runTest()
    }
    
    func runTest() {
        //        Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
        //        Output: [3,9,20,null,null,15,7]
        let preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
        let res = buildTree(preorder, inorder)
        displayLevelOrder(root: res)
    }
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var pIndex = 0
        return buildTreeHelper(preorder, inorder, &pIndex, 0, preorder.count - 1)
    }
    
    func buildTreeHelper(_ preorder: [Int], _ inorder: [Int], _ pIndex: inout Int, _ start: Int, _ end: Int) -> TreeNode? {
        if start > end {
            return nil
        }
        let root = TreeNode(preorder[pIndex])
        pIndex += 1
        var index = -1
        for i in 0..<inorder.count {
            if inorder[i] == root.val {
                index = i
                break
            }
        }
        root.left = buildTreeHelper(preorder, inorder, &pIndex, start, index - 1)
        root.right = buildTreeHelper(preorder, inorder, &pIndex, index+1, end)
        return root
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
        print("\n")
    }
    
}
