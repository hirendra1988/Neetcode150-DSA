//
//  LCAOfBST.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 07/01/25.
//

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
//https://neetcode.io/problems/lowest-common-ancestor-in-binary-search-tree
class LCAOfBST {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
//        Output: 6
//        Explanation: The LCA of nodes 2 and 8 is 6.
        let root = createRootTree()
        displayLevelOrder(root: root)
        let res = lowestCommonAncestor(root, root?.left, root?.left?.right?.right)
        displayLevelOrder(root: res)
    }
    
    //Time Complexity: O(h) || Space Compelxity: O(1)
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var cur: TreeNode? = root
        while cur != nil {
            if p!.val > cur!.val && q!.val > cur!.val {
                cur = cur?.right
            } else if p!.val < cur!.val && q!.val < cur!.val {
                cur = cur?.left
            } else {
                return cur
            }
        }
        return nil
    }
    // 2, 5
    //Time Complexity: O(n) || Space Compelxity: O(h)
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if p!.val > root.val && q!.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        } else if p!.val < root.val && q!.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        return root
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(6)
        let n2 = TreeNode(2)
        let n3 = TreeNode(8)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(0)
        let n5 = TreeNode(4)
        n2.left = n4
        n2.right = n5
        
        let n6 = TreeNode(3)
        let n7 = TreeNode(5)
        n5.left = n6
        n5.right = n7
        
        let n8 = TreeNode(7)
        let n9 = TreeNode(9)
        n3.left = n8
        n3.right = n9
        
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
        print("\n")
    }
    
}
