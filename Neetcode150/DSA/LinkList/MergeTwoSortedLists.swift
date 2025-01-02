//
//  MergeTwoSortedLists.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/01/25.
//

//https://leetcode.com/problems/merge-two-sorted-lists/
//https://neetcode.io/problems/merge-two-sorted-linked-lists
class MergeTwoSortedLists {
    
    class ListNode {
        var next: ListNode?
        var val: Int
        
        init(val: Int) {
            self.val = val
        }
    }
    
    init() {
//        Input: list1 = [1,2,4], list2 = [1,3,4]
//        Output: [1,1,2,3,4,4]
        runTest()
    }
    
    func runTest() {
        let rootNode1 = createRootNodeOne()
        displayNode(node: rootNode1)
        let rootNode2 = createRootNodeTwo()
        displayNode(node: rootNode2)
        
        let resultNode = mergeTwoLists(rootNode1, rootNode2)
        displayNode(node: resultNode)
    }
    
    func createRootNodeOne() -> ListNode? {
        let n1 = ListNode(val: 1)
        let n2 = ListNode(val: 2)
        n1.next = n2
        let n4 = ListNode(val: 4)
        n2.next = n4
        return n1
    }
    
    func createRootNodeTwo() -> ListNode? {
        let n1 = ListNode(val: 1)
        let n3 = ListNode(val: 3)
        n1.next = n3
        let n4 = ListNode(val: 4)
        n3.next = n4
        return n1
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var n1: ListNode? = list1
        var n2: ListNode? = list2
        let dummyNode = ListNode(val: 0)
        var currentNode: ListNode? = dummyNode
        
        while n1 != nil, n2 != nil {
            if (n1?.val ?? 0) <= (n2?.val ?? 0) {
                currentNode?.next = n1
                n1 = n1?.next
            } else {
                currentNode?.next = n2
                n2 = n2?.next
            }
            currentNode = currentNode?.next
        }
        if n1 != nil {
            currentNode?.next = n1
        } else {
            currentNode?.next = n2
        }
        return dummyNode.next
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
