//
//  Same Tree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/01/25.
//

//https://leetcode.com/problems/same-tree/
//https://neetcode.io/problems/same-binary-tree
class SameTree {
    
    init() {
        //        Input: p = [1,2,3], q = [1,2,3]
        //        Output: true
        runTest()
    }
    
    func runTest() {
        let root1 = createRootTreeOne()
        let root2 = createRootTreeOne()
        displayLevelOrder(root: root1)
        let res = isSameTree(root1, root2)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(h) where h is the height of the tree.
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return isSameTreeHelper(p, q)
    }
    
    func isSameTreeHelper(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }
        
        if p!.val != q!.val {
            return false
        }
        
        let leftNode = isSameTreeHelper(p!.left, q!.left)
        let rightNode = isSameTreeHelper(p!.right, q!.right)
        return leftNode && rightNode
    }
    
    func createRootTreeOne() -> TreeNode? {
        let n1 = TreeNode(1)
        let n2 = TreeNode(2)
        let n3 = TreeNode(3)
        n1.left = n2
        n1.right = n3
        return n1
    }
    
    func createRootTreeTwo() -> TreeNode? {
        let n1 = TreeNode(1)
        let n2 = TreeNode(2)
        let n3 = TreeNode(3)
        n1.left = n2
        n1.right = n3
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

