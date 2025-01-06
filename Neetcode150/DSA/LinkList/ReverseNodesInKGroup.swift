//
//  ReverseNodesInKGroup.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/01/25.
//

//https://leetcode.com/problems/reverse-nodes-in-k-group/
//https://neetcode.io/problems/reverse-nodes-in-k-group
class ReverseNodesInKGroup {
    
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
        //        Input: head = [1,2,3,4,5], k = 2
        //        Output: [2,1,4,3,5]
        let root = createRootNode()
        displayNode(node: root)
        let res = reverseKGroup(root, 2)
        displayNode(node: res)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1) //O(n/k)
    func reverseKGroup1(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var length = 0
        var n1: ListNode? = head
        while n1 != nil {
            n1 = n1?.next
            length += 1
        }
        if length < k {
            return head
        }
        
        var p1: ListNode? = nil
        var p2: ListNode? = head
        var p3: ListNode? = nil
        var pos = 0
        while pos < k {
            p3 = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = p3
            pos += 1
        }
        
        if p2 != nil {
            let newHead = reverseKGroup(p2, k)
            head?.next = newHead
        }
        
        return p1
    }
    
    //head = [1,2,3,4,5], k = 2
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head, k > 1 else { return head }
        
        // Determine length and validate group count
        var length = 0
        var tempNode: ListNode? = head
        while tempNode != nil {
            length += 1
            tempNode = tempNode?.next
        }
        
        if length < k { return head }
        
        let dummy = ListNode(0)
        dummy.next = head
        var prevTail: ListNode? = dummy
        var current: ListNode? = head
        
        for _ in 0..<(length / k) {
            let (newHead, newTail, nextNode) = reverse(current, k)
            prevTail?.next = newHead
            newTail?.next = nextNode
            prevTail = newTail
            current = nextNode
        }
        
        return dummy.next
    }
    
    // Helper function to reverse a section of the list
    func reverse(_ head: ListNode?, _ k: Int) -> (ListNode?, ListNode?, ListNode?) {
        var p1: ListNode? = nil
        var p2: ListNode? = head
        var p3: ListNode? = nil
        var count = 0
        
        while count < k, p2 != nil {
            p3 = p2?.next
            p2?.next = p1
            p1 = p2
            p2 = p3
            count += 1
        }
        return (p1, head, p2) // new head, tail of reversed, next node
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
