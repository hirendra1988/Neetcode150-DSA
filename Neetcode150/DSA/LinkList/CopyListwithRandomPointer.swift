//
//  CopyListwithRandomPointer.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/01/25.
//

class CopyListwithRandomPointer {
    
    class Node {
        var val: Int
        var next: Node?
        var random: Node?
        init(_ val: Int) {
            self.val = val
            self.next = nil
            self.random = nil
        }
    }
    
    init() {
//        Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
//        Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
        runTest()
    }
    
    func runTest() {
        let rootNode = createRootNode()
        display(node: rootNode)
        
        let res = copyRandomList(rootNode)
        display(node: res)
    }
    
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        
        let dummyNode = Node(0)
        var currentNode: Node? = dummyNode
        var n1: Node? = head
        var uMap = [ObjectIdentifier: Node]() // Maps original node to its copy
        
        // First pass: Create a deep copy of all nodes and map original nodes to their copies
        while n1 != nil {
            let newNode = Node(n1!.val)
            currentNode?.next = newNode
            uMap[ObjectIdentifier(n1!)] = newNode
            currentNode = newNode
            n1 = n1?.next
        }
        
        // Second pass: Set the random pointers using the map
        n1 = head
        currentNode = dummyNode.next
        while n1 != nil {
            if let random = n1?.random {
                currentNode?.random = uMap[ObjectIdentifier(random)]
            }
            currentNode = currentNode?.next
            n1 = n1?.next
        }
        
        return dummyNode.next
    }

    
    //Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
    func createRootNode() -> Node {
        let n1 = Node(7)
        
        let n2 = Node(13)
        n1.next = n2
        
        let n3 = Node(11)
        n2.next = n3
        
        let n4 = Node(10)
        n3.next = n4
        
        let n5 = Node(1)
        n4.next = n5
        
        //n1.random?.val = nil
        n2.random?.val = 0
        n3.random?.val = 4
        n4.random?.val = 2
        n5.random?.val = 0
        
        return n1
    }
    
    func display(node: Node?) {
        var n1: Node? = node
        while n1 != nil {
            print("\(n1!.val)", terminator: " -> ")
            n1 = n1?.next
        }
        print("\n")
    }
    
}
