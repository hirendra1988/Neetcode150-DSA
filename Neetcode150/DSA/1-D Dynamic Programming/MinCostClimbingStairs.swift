//
//  MinCostClimbingStairs.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/02/25.
//

//https://leetcode.com/problems/min-cost-climbing-stairs/
//https://neetcode.io/problems/min-cost-climbing-stairs
class MinCostClimbingStairs {
    
    init() {
        //        Input: cost = [10,15,20]
        //        Output: 15
        //        Explanation: You will start at index 1.
        //        - Pay 15 and climb two steps to reach the top.
        //        The total cost is 15.
        runTest()
    }
    
    func runTest() {
        let cost = [10,15,20]
        let result = minCostClimbingStairs(cost)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var first = cost[0]
        var second = cost[1]
        if cost.count < 3 {
            return min(first, second)
        }
        for i in 2..<cost.count {
            let temp = cost[i] + min(first, second)
            first = second
            second = temp
        }
        return min(first, second)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func minCostClimbingStairs1(_ cost: [Int]) -> Int {
        var first = 0
        var second = 0
        for step in cost {
            let temp = step + min(first, second)
            first = second
            second = temp
        }
        return min(first, second)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func minCostClimbingStairs2(_ cost: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: cost.count)
        dp[0] = cost[0]
        dp[1] = cost[1]
        for i in 2..<cost.count {
            dp[i] = min(cost[i] + dp[i-1], cost[i] + dp[i-2])
        }
        return min(dp[cost.count - 1], dp[cost.count - 2])
    }
    
}
