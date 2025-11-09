//
//  BalancedBinaryTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/01/25.
//

//https://leetcode.com/problems/balanced-binary-tree/
//https://neetcode.io/problems/balanced-binary-tree
class BalancedBinaryTree {
    
    init() {
//        Input: root = [3,9,20,null,null,15,7]
//        Output: true
        runTest()
    }
    
    func runTest() {
        let root = createRootTree()
        displayLevelOrder(root: root)
        let res = isBalanced(root)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(h) where h is the height of the tree.
    func isBalanced(_ root: TreeNode?) -> Bool {
        var balance = true
        _ = isBalancedHelper(root, &balance)
        return balance
    }
    
    func isBalancedHelper(_ root: TreeNode?, _ balance: inout Bool) -> Int {
        guard let root = root else { return 0 }
        let left = isBalancedHelper(root.left, &balance)
        let right = isBalancedHelper(root.right, &balance)
        if abs(left - right) > 1 {
            balance = false
            return 0
        }
        return max(left, right) + 1
    }
    
    func isBalanced2(_ root: TreeNode?) -> Bool {
        return isBalancedHelper2(root) != -1
    }
    
    func isBalancedHelper2(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = isBalancedHelper2(root.left)
        if left == -1 {
            return -1
        }
        let right = isBalancedHelper2(root.right)
        if right == -1 {
            return -1
        }
        if abs(left - right) > 1 {
            return -1
        }
        
        return max(left, right) + 1
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(1)
        let n2 = TreeNode(2)
        let n3 = TreeNode(2)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(3)
        let n5 = TreeNode(3)
        n2.left = n4
        n2.right = n5
        
        let n6 = TreeNode(4)
        let n7 = TreeNode(4)
        n4.left = n6
        n4.right = n7

        return n1
    }
    
//    func createRootTree() -> TreeNode? {
//        let n1 = TreeNode(3)
//        let n2 = TreeNode(9)
//        let n3 = TreeNode(20)
//        n1.left = n2
//        n1.right = n3
//        
//        let n4 = TreeNode(15)
//        let n5 = TreeNode(7)
//        n3.left = n4
//        n3.right = n5
//
//        return n1
//    }
    
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
