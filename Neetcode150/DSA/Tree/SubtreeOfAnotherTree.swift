//
//  SubtreeOfAnotherTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 07/01/25.
//

//https://leetcode.com/problems/subtree-of-another-tree/
//https://neetcode.io/problems/subtree-of-a-binary-tree
class SubtreeOfAnotherTree {
    
    init() {
//        Input: root = [3,4,5,1,2], subRoot = [4,1,2]
//        Output: true
        runTest()
    }
    
    func runTest() {
        let root = createRootTree()
        let subroot = createSubRootTree()
        displayLevelOrder(root: root)
        displayLevelOrder(root: subroot)
        
        let res = isSubtree(root, subroot)
        print(res)
    }
    
    //Time Complexity: O(n*m) || Space Compelxity: O(n)
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil {
            return true
        }
        if root == nil || subRoot == nil {
            return false
        }
        if validate(root, subRoot) {
            return true
        }
        return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
    }
    
    func validate(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil {
            return true
        }
        if root == nil || subRoot == nil {
            return false
        }
        if root?.val != subRoot?.val {
            return false
        }
        return validate(root?.left, subRoot?.left) && validate(root?.right, subRoot?.right)
    }
    
    
    // Not working for all test cases
    func isSubtree2(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        var rootArray = [Int]()
        var subrootArray = [Int]()
        inOrderForRoot(root, &rootArray)
        inOrderForSubRoot(subRoot, &subrootArray)
        
        var indx = 0
        for i in 0..<rootArray.count {
            if indx == subrootArray.count {
                return true
            }
            if rootArray[i] == subrootArray[indx] {
                indx += 1
            } else {
                if indx > 0 {
                    return false
                }
            }
        }
        
        return true
    }
    
    func inOrderForRoot(_ root: TreeNode?, _ rootArray: inout [Int]) {
        if root != nil {
            inOrderForRoot(root?.left, &rootArray)
            rootArray.append(root!.val)
            inOrderForRoot(root?.right, &rootArray)
        }
    }
    
    func inOrderForSubRoot(_ root: TreeNode?, _ subrootArray: inout [Int]) {
        if root != nil {
            inOrderForSubRoot(root?.left, &subrootArray)
            subrootArray.append(root!.val)
            inOrderForSubRoot(root?.right, &subrootArray)
        }
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(3)
        let n2 = TreeNode(4)
        let n3 = TreeNode(5)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(1)
        let n5 = TreeNode(2)
        n2.left = n4
        n2.right = n5
        
//        let n6 = TreeNode(0)
//        n5.left = n6
        
        return n1
    }
    
    func createSubRootTree() -> TreeNode? {
        let n1 = TreeNode(4)
        let n2 = TreeNode(1)
        let n3 = TreeNode(2)
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
