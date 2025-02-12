//
//  DistinctSubsequences.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 12/02/25.
//

//https://leetcode.com/problems/distinct-subsequences/
//https://neetcode.io/problems/count-subsequences
//https://www.youtube.com/watch?v=-RDzMJ33nx8
//https://www.youtube.com/watch?v=9yV6Elqvblw
class DistinctSubsequences {
    var checkCount = 0
    init() {
//        Input: s = "rabbbit", t = "rabbit"
//        Output: 3
//        Explanation:
//        As shown below, there are 3 ways you can generate "rabbit" from s.
//        rabbbit
//        rabbbit
//        rabbbit
        runTest()
    }
    
    func runTest() {
        let s = "rabbbit", t = "rabbit"
        let res = numDistinct(s, t)
        print(res)
        print(checkCount)
    }
    
    // Using Memoization
    // Time Complexity: O(m*n) || Space Compelxity: O(m*n)
    func numDistinct(_ s: String, _ t: String) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: -1, count: t.count), count: s.count)
        return numDistinctHelper1(Array(s), Array(t), 0, 0, &dp)
    }
    
    func numDistinctHelper1(_ sChars: [Character],
                           _ tChars: [Character],
                           _ i: Int,
                           _ j: Int,
                           _ dp: inout [[Int]]) -> Int {
        if j == tChars.count {
            return 1
        }
        if i == sChars.count {
            return 0
        }
        
        if dp[i][j] != -1 {
            return dp[i][j]
        }
        
        if sChars[i] == tChars[j] {
            dp[i][j] = numDistinctHelper1(sChars, tChars, i+1, j+1, &dp)
            + numDistinctHelper1(sChars, tChars, i+1, j, &dp)
            return dp[i][j]
        }
        dp[i][j] = numDistinctHelper1(sChars, tChars, i + 1, j, &dp)
        return dp[i][j]
    }
    
}
