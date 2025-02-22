//
//  MergeIntervals.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 22/02/25.
//

//https://leetcode.com/problems/merge-intervals/
//https://neetcode.io/problems/merge-intervals/
class MergeIntervals {
    
    init() {
//        Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
//        Output: [[1,6],[8,10],[15,18]]
//        Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
        runTest()
    }
    
    func runTest() {
        let intervals = [[1,4],[4,5]]//[[1,3],[2,6],[8,10],[15,18]]
        let result = merge(intervals)
        print(result)
    }
    
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty {
            return intervals
        }
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var result = [[Int]]()
        result.append(sortedIntervals[0])
        
        for i in 1..<sortedIntervals.count {
            if result.last![1] < sortedIntervals[i][0] {
                result.append(sortedIntervals[i])
            } else if result.last![1] >= sortedIntervals[i][0] {
                result[result.count - 1][0] = min(result.last![0], sortedIntervals[i][0])
                result[result.count - 1][1] = max(result.last![1], sortedIntervals[i][1])
            }
        }
        return result
    }
    
}
