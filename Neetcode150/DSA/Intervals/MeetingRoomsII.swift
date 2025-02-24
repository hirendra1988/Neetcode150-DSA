//
//  MeetingRoomsII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/02/25.
//

//https://leetcode.com/problems/meeting-rooms-ii/
//https://neetcode.io/problems/meeting-schedule-ii
//https://www.youtube.com/watch?v=FdzJmTCVyJU&t=54s
class MeetingRoomsII {
    
    init() {
//        Example 1:
//        Input: intervals = [[0,30],[5,10],[15,20]]
//        Output: 2
//        
//        Example 2:
//        Input: intervals = [[7,10],[2,4]]
//        Output: 1
        runTest()
    }
    
    func runTest() {
        let intervals = [[0,30],[5,10],[15,20]]
        let res = minMeetingRooms(intervals)
        print(res)
    }
    
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty {
            return 0
        }
        let startTime = intervals.map { $0[0] }.sorted()
        let endTime = intervals.map { $0[1] }.sorted()
        var startIdx = 0
        var endIdx = 0
        var count = 0
        var res = 0
        while startIdx < startTime.count {
            if startTime[startIdx] < endTime[endIdx] {
                startIdx += 1
                count += 1
            } else {
                count -= 1
                endIdx += 1
            }
            res = max(res, count)
        }
        return res
    }
    
}
