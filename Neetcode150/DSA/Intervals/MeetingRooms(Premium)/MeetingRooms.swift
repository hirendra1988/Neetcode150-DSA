//
//  MeetingRooms.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 23/02/25.
//

//https://leetcode.com/problems/meeting-rooms/
//https://neetcode.io/problems/meeting-schedule
class MeetingRooms {
    
    init() {
//        Example 1:
//        Input: intervals = [[0,30],[5,10],[15,20]]
//        Output: false
        
//        Example 2:
//        Input: intervals = [[7,10],[2,4]]
//        Output: true
        runTest()
    }
    
    func runTest() {
        let intervals = [[0,30],[5,10],[15,20]]
        let result = canAttendMeetings(intervals)
        print(result)
    }
    
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        if intervals.isEmpty {
            return true
        }
        let sortedInterval = intervals.sorted { $0[0] < $1[0] }
        var lastPoint = Int.min
        for i in 0..<sortedInterval.count {
            let interval = sortedInterval[i]
            if lastPoint <= interval[0] {
                lastPoint = interval[1]
            } else {
                return false
            }
        }
        return true
    }

    func canAttendMeetings2(_ intervals: [[Int]]) -> Bool {
        if intervals.isEmpty {
            return true
        }
        var sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        for i in 0..<sortedIntervals.count - 1 {
            let firstNext = sortedIntervals[i][1]
            let nextPrev = sortedIntervals[i+1][0]
            if nextPrev < firstNext {
                return false
            }
        }
        return true
    }
    
}
