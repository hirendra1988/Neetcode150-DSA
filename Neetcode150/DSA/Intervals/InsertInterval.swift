//
//  InsertInterval.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 22/02/25.
//

//https://leetcode.com/problems/insert-interval/
//https://neetcode.io/problems/insert-new-interval
//https://www.youtube.com/watch?v=wCBtjZxw1xY&t=19s
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
        //intervals = [[1,3],[6,9]], newInterval = [2,5]
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

    func insert2(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let n = intervals.count
        var i = 0
        var newInterval = newInterval
        
        // Add all intervals before newInterval
        while i < n, intervals[i][1] < newInterval[0] {
            result.append(intervals[i])
            i += 1
        }
        
        // Merge overlapping intervals
        while i < n , intervals[i][0] <= newInterval[1] {
            newInterval[0] = min(newInterval[0], intervals[i][0])
            newInterval[1] = max(newInterval[1], intervals[i][1])
            i += 1
        }
        result.append(newInterval)
        
        // Add remaining intervals
        while i < n {
            result.append(intervals[i])
            i += 1
        }
        
        return result
    }
    
}
