//
//  CountGoodNodesInBT.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 09/01/25.
//

//https://leetcode.com/problems/count-good-nodes-in-binary-tree/
//https://neetcode.io/problems/count-good-nodes-in-binary-tree
class CountGoodNodesInBT {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: root = [3,1,4,3,null,1,5]
//        Output: 4
//        Explanation: Nodes in blue are good.
//        Root Node (3) is always a good node.
//        Node 4 -> (3,4) is the maximum value in the path starting from the root.
//        Node 5 -> (3,4,5) is the maximum value in the path
//        Node 3 -> (3,1,3) is the maximum value in the path.
        let root = createRootTree()
        //displayLevelOrder(root: root)
        let res = goodNodes(root)
        print(res)
    }

    func goodNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var count = 0
        goodNodesHelper(root, &count, root!.val)
        return count
    }
    
    func goodNodesHelper(_ root: TreeNode?, _ count: inout Int, _ maxNode: Int) {
        guard let root = root else { return }
        
        if root.val >= maxNode {
            count += 1
        }
        let maxNode = max(maxNode, root.val)
        goodNodesHelper(root.left, &count, maxNode)
        goodNodesHelper(root.right, &count, maxNode)
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(9)
        let n2 = TreeNode(3)
        let n3 = TreeNode(6)
        n1.right = n2
        n2.left = n3
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
