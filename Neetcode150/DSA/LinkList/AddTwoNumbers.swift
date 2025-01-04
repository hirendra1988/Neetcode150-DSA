//
//  AddTwoNumbers.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/01/25.
//

class AddTwoNumbers {
    
    class ListNode {
        var next: ListNode?
        var val: Int
        
        init(_ val: Int) {
            self.val = val
        }
    }
    
    init() {
//        Input: l1 = [2,4,3], l2 = [5,6,4]
//        Output: [7,0,8]
//        Explanation: 342 + 465 = 807.
//        Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//        Output: [8,9,9,9,0,0,0,1]
        runTest()
    }
    
    func runTest() {
        let node1 = createRootNodeOne()
        let node2 = createRootNodeTwo()
//        displayNode(node: node1)
//        displayNode(node: node2)
        
        let res = addTwoNumbers(node1, node2)
        displayNode(node: res)
    }
    
    // Time Complexity: O(max(m,n)) || Space Compelxity: O(max(m,n))
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1: ListNode? = l1
        var n2: ListNode? = l2
        
        let dummyNode = ListNode(0)
        var currentNode: ListNode? = dummyNode
        var remainder = 0
        while n1 != nil || n2 != nil {
            let sum = (n1?.val ?? 0) + (n2?.val ?? 0) + remainder
            let value = sum % 10
            remainder = sum / 10
            
            let newNode = ListNode(value)
            currentNode?.next = newNode
            
            currentNode = currentNode?.next
            n1 = n1?.next
            n2 = n2?.next
        }
        
        if remainder != 0 {
            currentNode?.next = ListNode(remainder)
        }
        
        return dummyNode.next
    }
    
    func createRootNodeOne() -> ListNode? {
        let n1 = ListNode(9)
        let n2 = ListNode(9)
        n1.next = n2
        let n3 = ListNode(9)
        n2.next = n3
        let n4 = ListNode(9)
        n3.next = n4
        
        let n5 = ListNode(9)
        n4.next = n5
        
        let n6 = ListNode(9)
        n5.next = n6
        
        let n7 = ListNode(9)
        n6.next = n7
        return n1
    }
    
    func createRootNodeTwo() -> ListNode? {
        let n1 = ListNode(9)
        let n2 = ListNode(9)
        n1.next = n2
        let n3 = ListNode(9)
        n2.next = n3
        let n4 = ListNode(9)
        n3.next = n4
        return n1
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
