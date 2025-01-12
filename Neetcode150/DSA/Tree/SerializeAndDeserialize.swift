//
//  SerializeAndDeserialize.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 12/01/25.
//

//https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
//https://neetcode.io/problems/serialize-and-deserialize-binary-tree
class SerializeAndDeserialize {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: root = [1,2,3,null,null,4,5]
//        Output: [1,2,3,null,null,4,5]
        let root = createRootTree()
        let serilizeStr = serialize(root)
        print(serilizeStr)
        
        let deserializeNode = deserialize(serilizeStr)
        displayLevelOrder(root: deserializeNode)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func serialize(_ root: TreeNode?) -> String {
        if root == nil {
            return "null,"
        }
        var str = "\(root!.val),"
        str += serialize(root?.left)
        str += serialize(root?.right)
        return str
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func deserialize(_ data: String) -> TreeNode? {
        var array = data.components(separatedBy: ",")
        return deserializeHelper(&array)
    }
    
    private func deserializeHelper(_ queue: inout [String]) -> TreeNode? {
        let value = queue.removeFirst()
        if value == "null" {
            return nil
        }
        let newNode = TreeNode(Int(value) ?? 0)
        newNode.left = deserializeHelper(&queue)
        newNode.right = deserializeHelper(&queue)
        return newNode
    }
    
    func createRootTree() -> TreeNode? {
        let n1 = TreeNode(1)
        let n2 = TreeNode(2)
        let n3 = TreeNode(3)
        n1.left = n2
        n1.right = n3
        
        let n4 = TreeNode(4)
        let n5 = TreeNode(5)
        n3.left = n4
        n3.right = n5

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
