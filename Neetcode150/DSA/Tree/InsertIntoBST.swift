//
//  InsertIntoBST.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 09/11/25.
//

//https://leetcode.com/problems/insert-into-a-binary-search-tree/
//https://neetcode.io/problems/insert-into-a-binary-search-tree?list=neetcode250
class InsertIntoBST {
    
    init() {
        
    }
    
    func runTest() {
        
    }

    //Time Complexity: O(h) || Sapce Complexity: O(h)
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        if val < root.val {
            root.left = insertIntoBST(root.left, val)
        } else {
            root.right = insertIntoBST(root.right, val)
        }
        return root
    }

}
