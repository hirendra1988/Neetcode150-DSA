//
//  Non-overlappingIntervals.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 23/02/25.
//

//https://leetcode.com/problems/non-overlapping-intervals/
//https://neetcode.io/problems/non-overlapping-intervals
class NonOverlappingIntervals {
    
    init() {
        //        Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
        //        Output: 1
        //        Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
        runTest()
    }
    
    func runTest() {
        let intervals = [[1,2],[2,3],[3,4],[1,3]]
        let result = eraseOverlapIntervals(intervals)
        print(result)
    }
    
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty {
            return 0
        }
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var result = 0
        var lastPoint = Int.min
        for i in 0..<sortedIntervals.count {
            let interval = sortedIntervals[i]
            if lastPoint <= interval[0] {
                lastPoint = interval[1]
            } else {
                lastPoint = min(lastPoint, interval[1])
                result += 1
            }
        }
        return result
    }
    
}
