//
//  RemoveNthNodeFromEnd.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/01/25.
//

//https://leetcode.com/problems/remove-nth-node-from-end-of-list/
//https://neetcode.io/problems/remove-node-from-end-of-linked-list
class RemoveNthNodeFromEnd {
    
    class ListNode {
        var next: ListNode?
        var val: Int
        
        init(_ val: Int) {
            self.val = val
        }
    }
    
    init() {
//        Input: head = [1,2,3,4,5], n = 2
//        Output: [1,2,3,5]
        runTest()
    }
    
    func runTest() {
        let rootNode = createRootNode()
        let res = removeNthFromEnd(rootNode, 2)
        displayNode(node: res)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head?.next == nil {
            return nil
        }
        var firstPointer: ListNode? = head
        var secondPointer: ListNode? = head
        var count = 1
        while count <= n {
            secondPointer = secondPointer?.next
            count += 1
        }
        if secondPointer == nil {
            head?.val = head?.next?.val ?? 0
            head?.next = head?.next?.next
            return head
        }
        
        while secondPointer?.next != nil {
            firstPointer = firstPointer?.next
            secondPointer = secondPointer?.next
        }
        
        firstPointer?.next = firstPointer?.next?.next
        return head
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
    
    func displayNode(node: ListNode?) {
        var n1: ListNode? = node
        while n1 != nil {
            print(n1!.val, terminator: " -> ")
            n1 = n1?.next
        }
        print("\n")
    }
    
}
