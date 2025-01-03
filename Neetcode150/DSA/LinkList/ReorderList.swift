//
//  ReorderList.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/01/25.
//

//https://leetcode.com/problems/reorder-list/
//https://neetcode.io/problems/reorder-linked-list
class ReorderList {
    
    class ListNode {
        var next: ListNode?
        var val: Int
        
        init(_ val: Int) {
            self.val = val
        }
    }
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: head = [1,2,3,4]
//        Output: [1,4,2,3]
        let rootNode = createRootNode()
        //displayNode(node: rootNode)
        reorderList(rootNode)
        displayNode(node: rootNode)
    }
    
    func createRootNode() -> ListNode? {
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        n1.next = n2
        let n3 = ListNode(3)
        n2.next = n3
        let n4 = ListNode(4)
        n3.next = n4
        
        let n5 = ListNode(5)
        n4.next = n5
        
        return n1
    }

    // Time Complexity: O(n) || Space Compelxity: O(1)
    func reorderList(_ head: ListNode?) {
        if head == nil || head?.next == nil {
            return
        }
        let firstHalf = head
        let secondHalf = getSecondHalf(head)
        let reverseSecondHalf = reverseLinkList(node: secondHalf)
        mergeTwoLinkList(node1: firstHalf, node2: reverseSecondHalf)
        displayNode(node: head)
    }
    
    func getSecondHalf(_ head: ListNode?) -> ListNode? {
        var slowPointer: ListNode? = head
        var fastPointer: ListNode? = head
        var prevNode: ListNode? = nil
        while fastPointer != nil, fastPointer?.next != nil {
            prevNode = slowPointer
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        prevNode?.next = nil
        return slowPointer
    }
    
    func reverseLinkList(node: ListNode?) -> ListNode? {
        var p1: ListNode? = nil
        var p2: ListNode? = node
        while p2 != nil {
            let p3 = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = p3
        }
        return p1
    }
    
    // 1, 2
    // 3, 4, 5
    func mergeTwoLinkList(node1: ListNode?, node2: ListNode?) {
        var n1: ListNode? = node1
        var n2: ListNode? = node2
        while n1 != nil, n2 != nil {
            
            let n1NextPointer = n1?.next
            let n2NextPointer = n2?.next
            n1?.next = n2
            
            if n1NextPointer == nil {
                n2?.next = n2NextPointer
                break
            }
            
            n2?.next = n1NextPointer
            
            n1 = n1NextPointer
            n2 = n2NextPointer
        }
    }
    
    func mergeTwoLinkList2(node1: ListNode?, node2: ListNode?) {
        let dummyNode = ListNode(0)
        var currentNode: ListNode? = dummyNode
        var n1: ListNode? = node1
        var n2: ListNode? = node2
        while n1 != nil, n2 != nil {
            currentNode?.next = n1
            n1 = n1?.next
            
            currentNode = currentNode?.next
            currentNode?.next = n2
            n2 = n2?.next
            
            currentNode = currentNode?.next
            
        }
        
        displayNode(node: dummyNode.next)
    }

    func displayNode(node: ListNode?) {
        var n1: ListNode? = node
        while n1 != nil {
            print(n1!.val, terminator: " -> ")
            n1 = n1?.next
        }
        print("\n")
    }
    
}
