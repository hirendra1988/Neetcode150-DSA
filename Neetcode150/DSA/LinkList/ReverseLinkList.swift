//
//  ReverseLinkList.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/01/25.
//

//https://leetcode.com/problems/reverse-linked-list/
//https://neetcode.io/problems/reverse-a-linked-list
class ReverseLinkList {
    
    class ListNode {
        var next: ListNode?
        var val: Int
        
        init(val: Int) {
            self.val = val
        }
    }
    
    init() {
//        Input: head = [1,2,3,4,5]
//        Output: [5,4,3,2,1]
        runTest()
    }
    
    func createRootNode() -> ListNode? {
        let n1 = ListNode(val: 1)
        let n2 = ListNode(val: 2)
        n1.next = n2
        let n3 = ListNode(val: 3)
        n2.next = n3
        let n4 = ListNode(val: 4)
        n3.next = n4
        let n5 = ListNode(val: 5)
        n4.next = n5
        return n1
    }
    
    func runTest() {
        let rootNode = createRootNode()
        displayNode(node: rootNode)
        let resultNode = reverseList(rootNode)
        displayNode(node: resultNode)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func reverseList(_ head: ListNode?) -> ListNode? {
        var p1: ListNode? = nil
        var p2: ListNode? = head
        while p2 != nil {
            let p3 = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = p3
        }
        return p1
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
