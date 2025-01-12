//
//  MaximumPathSum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 12/01/25.
//

//https://leetcode.com/problems/binary-tree-maximum-path-sum/
//https://neetcode.io/problems/binary-tree-maximum-path-sum
class MaximumPathSum {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: root = [-10,9,20,null,null,15,7]
//        Output: 42
//        Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
        let root = createRootTree()
        displayLevelOrder(root)
        let res = maxPathSum(root)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxPath = Int.min
        _ = maxPathSumHelper(root, &maxPath)
        return maxPath
    }
    
    func maxPathSumHelper(_ root: TreeNode?, _ maxPath: inout Int) -> Int {
        guard let root = root else { return 0 }
        let left = max(maxPathSumHelper(root.left, &maxPath), 0)
        let right = max(maxPathSumHelper(root.right, &maxPath), 0)
        maxPath = max(maxPath, left + right + root.val)
        return max(left, right) + root.val
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(-10)
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
    
    func displayLevelOrder(_ root: TreeNode?) {
        var queue = [TreeNode]()
        queue.append(root!)
        
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
