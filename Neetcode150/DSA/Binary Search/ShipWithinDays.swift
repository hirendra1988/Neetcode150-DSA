//
//  ShipWithinDays.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 08/11/25.
//

//https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/
//https://neetcode.io/problems/capacity-to-ship-packages-within-d-days?list=neetcode250
//https://www.youtube.com/watch?v=f2qf4u_O2QE
class ShipWithinDays {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: weights = [1,2,3,4,5,6,7,8,9,10], days = 5
//        Output: 15
        let weights = [1,2,3,4,5,6,7,8,9,10], days = 5
        print(shipWithinDays(weights, days))
    }
    
    // Time Complexity: O(nlog(S)) || Space Compelxity: O(1)
    //n = number of packages
    //S = sum of all weights
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var minCap = 0
        var maxCap = 0
        for weight in weights {
            minCap = max(minCap, weight)
            maxCap += weight
        }
        while minCap <= maxCap {
            let mid = (minCap + maxCap)/2
            var totalDays = 1
            var sum = 0
            for weight in weights {
                if (sum + weight) > mid {
                    totalDays += 1
                    sum = 0
                }
                sum += weight
            }
            
            if totalDays > days {
                minCap = mid + 1
            } else {
                maxCap = mid - 1
            }
        }
        return minCap
    }
    
}
