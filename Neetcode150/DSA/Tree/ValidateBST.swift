//
//  ValidateBST.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/01/25.
//

//https://leetcode.com/problems/validate-binary-search-tree/
//https://neetcode.io/problems/valid-binary-search-tree/
class ValidateBST {
    
    init() {
        runTest()
    }
    
    func runTest() {
        //        Input: root = [5,1,4,null,null,3,6]
        //        Output: false
        //        Explanation: The root node's value is 5 but its right child's value is 4.
        let root = createRootTree()
        let res = isValidBST(root)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBSTHelper(root, Int.min, Int.max)
    }
    
    func isValidBSTHelper(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let root = root else { return true }
        if min >= root.val || max <= root.val {
            return false
        }
        return isValidBSTHelper(root.left, min, root.val) && isValidBSTHelper(root.right, root.val, max)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func isValidBST2(_ root: TreeNode?) -> Bool {
        var isValid = true
        var arr = [Int]()
        inorder(root, &arr)
        for i in 0..<arr.count - 1 {
            if arr[i+1] <= arr[i] {
                isValid = false
                break
            }
        }
        return isValid
    }
    
    func inorder(_ root: TreeNode?, _ arr: inout [Int]) {
        guard let root = root else { return }
        inorder(root.left, &arr)
        arr.append(root.val)
        inorder(root.right, &arr)
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(5)
        let n2 = TreeNode(1)
        let n3 = TreeNode(4)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(3)
        let n5 = TreeNode(6)
        n3.left = n4
        n3.right = n5
        
        return n1
    }
    
}
