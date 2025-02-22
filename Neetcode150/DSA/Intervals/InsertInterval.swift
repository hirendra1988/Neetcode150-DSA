//
//  InsertInterval.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 22/02/25.
//

//https://leetcode.com/problems/insert-interval/
//https://neetcode.io/problems/insert-new-interval
class InsertInterval {
    
    init() {
//        Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
//        Output: [[1,5],[6,9]]
        runTest()
    }
    
    func runTest() {
        let intervals = [[1,3],[6,9]], newInterval = [2,5]
        let result = insert(intervals, newInterval)
        print(result)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if newInterval.isEmpty {
            return intervals
        }
        var result = [[Int]]()
        var newInterval = newInterval
        for interval in intervals {
            if newInterval.isEmpty || interval[1] < newInterval[0] {
                result.append(interval)
            } else if interval[0] > newInterval[1] {
                result.append(newInterval)
                result.append(interval)
                newInterval = []
            } else {
                newInterval[0] = min(interval[0], newInterval[0])
                newInterval[1] = max(interval[1], newInterval[1])
            }
        }
        if !newInterval.isEmpty {
            result.append(newInterval)
        }
        return result
    }
    
}
