//
//  LinkedListCycle.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/01/25.
//

//https://leetcode.com/problems/linked-list-cycle/
//https://neetcode.io/problems/linked-list-cycle-detection
class LinkedListCycle {
    
    class ListNode {
        var next: ListNode?
        var val: Int
        
        init(val: Int) {
            self.val = val
        }
    }
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: head = [3,2,0,-4], pos = 1
//        Output: true
        let rootNode = createRootNodeOne()
        let res = hasCycle(rootNode)
        print(res)
    }

    // Time Complexity: O(n) || Space Compelxity: O(1)
    func hasCycle(_ head: ListNode?) -> Bool {
        var slowPointer: ListNode? = head?.next
        var fastPointer: ListNode? = head?.next?.next
        
        while slowPointer !== fastPointer {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
            
            if slowPointer === fastPointer {
                slowPointer = head
                
                while slowPointer !== fastPointer {
                    slowPointer = slowPointer?.next
                    fastPointer = fastPointer?.next
                }
            }
        }
        return slowPointer == nil ? false : true
    }
    
    func createRootNodeOne() -> ListNode? {
        let n1 = ListNode(val: 3)
        let n2 = ListNode(val: 2)
        n1.next = n2
        let n3 = ListNode(val: 0)
        n2.next = n3
        
        let n4 = ListNode(val: -4)
        n3.next = n4
        n4.next = n2
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
