//
//  MergekSortedLists.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/01/25.
//

//https://leetcode.com/problems/merge-k-sorted-lists/
//https://neetcode.io/problems/merge-k-sorted-linked-lists
class MergekSortedLists {
    
    class ListNode {
        var next: ListNode?
        var val: Int
        
        init(_ val: Int) {
            self.val = val
        }
    }
    
    init() {
        //        Input: lists = [[1,4,5],[1,3,4],[2,6]]
        //        Output: [1,1,2,3,4,4,5,6]
        //        Explanation: The linked-lists are:
        //        [
        //          1->4->5,
        //          1->3->4,
        //          2->6
        //        ]
        //        merging them into one sorted list:
        //        1->1->2->3->4->4->5->6
        runTest()
    }
    
    func runTest() {
        let lists = createListNodes()
        let res = mergeKLists(lists)
        displayNode(node: res)
    }
    
    // Time Complexity: O(nlogk) // where N is the total number of nodes, and k is the number of lists.
    // Space Compelxity: O(1)
    // two-pointer approach
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty {
            return nil
        }
        var lists = lists
        var right = lists.count - 1
        
        while right > 0 {
            var left = 0
            while left < right {
                lists[left] = mergeTwoSortedList(lists[left], lists[right])
                left += 1
                right -= 1
            }
        }
        return lists[0]
    }
    
    //divide-and-conquer approach
    func mergeKLists2(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty {
            return nil
        }
        var lists = lists
        var interval = 1
        
        while interval < lists.count {
            var i = 0
            while (i+interval) < lists.count {
                lists[i] = mergeTwoSortedList(lists[i], lists[i+interval])
                i += interval * 2
                print(i)
            }
            interval *= 2
            print(interval)
        }
        return lists[0]
    }
    
    func mergeTwoSortedList(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        let dummyNode = ListNode(0)
        var currentNode: ListNode? = dummyNode
        var n1: ListNode? = node1
        var n2: ListNode? = node2
        
        while n1 != nil, n2 != nil {
            if (n1?.val ?? 0) < (n2?.val ?? 0) {
                currentNode?.next = n1
                n1 = n1?.next
            } else {
                currentNode?.next = n2
                n2 = n2?.next
            }
            currentNode = currentNode?.next
        }
        
        currentNode?.next = n1 ?? n2
        return dummyNode.next
    }
    
    func createListNodes() -> [ListNode] {
        let n1 = ListNode(1)
        let n4 = ListNode(4)
        n1.next = n4
        let n5 = ListNode(5)
        n4.next = n5
        
        let n11 = ListNode(1)
        let n3 = ListNode(3)
        n11.next = n3
        let n44 = ListNode(4)
        n3.next = n44
        
        let n2 = ListNode(2)
        let n6 = ListNode(6)
        n2.next = n6
        
        return [n1, n11, n2]
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
