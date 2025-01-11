//
//  kthSmallestElementInBST.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/01/25.
//

//https://leetcode.com/problems/kth-smallest-element-in-a-bst/
//https://neetcode.io/problems/kth-smallest-integer-in-bst
class kthSmallestElementInBST {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: root = [5,3,6,2,4,null,null,1], k = 3
//        Output: 3
        let root = createRootTree()
        let k = 3
        let res = kthSmallest(root, k)
        print(res)
    }
    
    //Time Complexity: O(h+k) || Space Compelxity: O(h)
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var current = root
        var count = 0
        
        while !stack.isEmpty || current != nil {
            // Traverse to the leftmost node
            while let node = current {
                stack.append(node)
                current = node.left
            }
            
            // Process the node
            current = stack.removeLast()
            count += 1
            
            // Check if this is the kth smallest
            if count == k {
                return current!.val
            }
            
            // Move to the right subtree
            current = current?.right
        }
        
        return -1 // Should not happen if k is valid
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n) Using Inorder traversal
    func kthSmallest2(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var result = 0
        inorder(root, k, &count, &result)
        return result
    }
    
    func inorder(_ root: TreeNode?, _ k: Int, _ count: inout Int, _ result: inout Int) {
        guard let root = root else {
            return
        }
        if root.left != nil {
            inorder(root.left, k, &count, &result)
        }
        count += 1
        if count == k {
            result = root.val
            return
        }
        if root.right != nil {
            inorder(root.right, k, &count, &result)
        }
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n) Using Inorder traversal
    func kthSmallest1(_ root: TreeNode?, _ k: Int) -> Int {
        var array = [Int]()
        inorder(root, &array)
        return array[k-1]
    }
    
    func inorder(_ root: TreeNode?, _ array: inout [Int]) {
        guard let root = root else {
            return
        }
        inorder(root.left, &array)
        array.append(root.val)
        inorder(root.right, &array)
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(5)
        let n2 = TreeNode(3)
        let n3 = TreeNode(6)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(2)
        let n5 = TreeNode(4)
        n2.left = n4
        n2.right = n5
        
        let n6 = TreeNode(1)
        n4.left = n6

        return n1
    }
    
}
