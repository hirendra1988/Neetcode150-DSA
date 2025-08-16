//
//  AngleBetweenHandsOfClock.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/08/25.
//

//https://leetcode.com/problems/angle-between-hands-of-a-clock/description/
//https://www.youtube.com/watch?v=5pb8SfKRwe0
class AngleBetweenHandsOfClock {
    init() {
        runTest()
    }

    func runTest() {
//        Input: hour = 12, minutes = 30
//        Output: 165
        let hour = 12, minutes = 30
        let res = angleClock(hour, minutes)
        print(res)
    }

    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        // for hour
        // 360/12 = 30 degree per hour
        // 30/60 = 1/2 degree per minute
        
        // for Minute
        // 360 degree per hour or 0 degree per hour
        // 360/60 = 6 degree per minute
        
        let hourAngle = Double(hour) * 30 + Double(minutes) * 1/2
        let minuteAngle = Double(hour * 0 + minutes * 6)
        let totalAngle = abs(hourAngle - minuteAngle)
        if totalAngle <= 180 {
            return totalAngle
        }
        return 360-totalAngle
    }
}
