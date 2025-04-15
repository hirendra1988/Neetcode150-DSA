//
//  ClimbingStairs.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/02/25.
//

//https://leetcode.com/problems/climbing-stairs/
//https://neetcode.io/problems/climbing-stairs
class ClimbingStairs {
    
    init() {
        //        Input: n = 2
        //        Output: 2
        //        Explanation: There are two ways to climb to the top.
        //        1. 1 step + 1 step
        //        2. 2 steps
        runTest()
    }
    
    func runTest() {
        let result = climbStairs(3)
        print(result)
    }
    
    // MARK: Using Fibonacci Approach (Best Approach)
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func climbStairs2(_ n: Int) -> Int {
        if n < 3 {
            return n
        }
        var first = 1
        var second = 2
        for _ in 3...n {
            let temp = first + second
            first = second
            second = temp
        }
        return second
    }
    
    // MARK: Using Dynamic Programming (Better)
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func climbStairs1(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        var dp = [Int](repeating: 0, count: n)
        dp[0] = 1
        dp[1] = 2
        for i in 2..<n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n-1]
    }
    
    // MARK: Using Recursion (Not optimal)
    // Time Complexity: O(2^n) || Space Compelxity: O(n)
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        return climbStairs(n-1) + climbStairs(n-2)
    }
    
    
}
