//
//  LastStoneWeight.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 29/01/25.
//

//https://leetcode.com/problems/last-stone-weight/
//https://neetcode.io/problems/last-stone-weight
class LastStoneWeight {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let stones = [1,3]//[2,7,4,1,8,1]
        let res = lastStoneWeight(stones)
        print(res)
    }
    
    // Time Complexity: O(nlogn) = O(n2)
    // Space Compelxity: O(n)
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var sortedArray = stones.sorted(by: >)
        while sortedArray.count > 1 {
            let first = sortedArray.removeFirst()
            let second = sortedArray.removeFirst()
            if first != second {
                sortedArray.append(first - second)
                sortedArray = sortedArray.sorted(by: >)
            }
        }
        return sortedArray.first ?? 0
    }
    
}
