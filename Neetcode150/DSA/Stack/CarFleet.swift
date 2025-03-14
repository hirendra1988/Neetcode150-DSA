//
//  CarFleet.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 21/12/24.
//

//https://leetcode.com/problems/car-fleet/
//https://neetcode.io/problems/car-fleet
class CarFleet {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let target = 12, position = [10,8,0,5,3], speed = [2,4,1,1,3] //Output: 3
        let res = carFleet(target, position, speed)
        print(res)
    }

    // Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        if position.count == 1 {
            return 1
        }
        let array = zip(position, speed).sorted { $0.0 < $1.0 }
        var stack = [Double]()
        for (position, speed) in array {
            // formula: d = t * speed
            let time = Double(target - position) / Double(speed)
            while !stack.isEmpty, time >= stack.last! {
                stack.popLast()
            }
            stack.append(time)
        }
        return stack.count
    }
    //[(0, 1), (3, 3), (5, 1), (8, 4), (10, 2)]
}
