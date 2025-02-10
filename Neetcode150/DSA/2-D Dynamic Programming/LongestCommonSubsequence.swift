//
//  LongestCommonSubsequence.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 10/02/25.
//

//https://www.youtube.com/watch?v=0yvOxPwe3Dg
//https://www.youtube.com/watch?v=p09b1IzQa_A
//https://leetcode.com/problems/longest-common-subsequence/
//https://neetcode.io/problems/longest-common-subsequence
class LongestCommonSubsequence {
    
    init() {
//        Input: text1 = "abcde", text2 = "ace"
//        Output: 3
//        Explanation: The longest common subsequence is "ace" and its length is 3.
        runTest()
    }
    
    func runTest() {
        let text1 = "abcde", text2 = "ace"
        let res = longestCommonSubsequence(text1, text2)
        print(res)
    }
    
    // Using Tabulation
    // Time Complexity: O(m*n) || Space Compelxity: O(m*n)
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        var dp = Array(repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        let text1Chars = Array(text1)
        let text2Chars = Array(text2)
        for i in 1...text1Chars.count {
            for j in 1...text2Chars.count {
                if text1Chars[i-1] == text2Chars[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[m][n]
    }
    
    // Using Memoization
    // Time Complexity: O(m*n) || Space Compelxity: O(m*n)
    func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
        var memo: [[Int]] = Array(repeating: [Int](repeating: 0, count: text2.count), count: text1.count)
        return lcsHelper2(Array(text1), text1.count, Array(text2), text2.count, &memo)
    }
    
    func lcsHelper2(_ text1: [Character], _ m: Int, _ text2: [Character], _ n: Int, _ memo: inout [[Int]]) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        
        if memo[m-1][n-1] != 0 {
            return memo[m-1][n-1]
        }
        
        if text1[m-1] == text2[n-1] {
            memo[m-1][n-1] = 1 + lcsHelper2(text1, m-1, text2, n-1, &memo)
        } else {
            memo[m-1][n-1] = max(lcsHelper2(text1, m-1, text2, n, &memo), lcsHelper2(text1, m, text2, n-1, &memo))
        }
        return memo[m-1][n-1]
    }
    
    // Using Recursion
    // Time Complexity: O(2^(m+n)) || Space Compelxity: O(m+n)
    func longestCommonSubsequence1(_ text1: String, _ text2: String) -> Int {
        return lcsHelper1(Array(text1), text1.count, Array(text2), text2.count)
    }
    
    func lcsHelper1(_ text1: [Character], _ m: Int, _ text2: [Character], _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        if text1[m-1] == text2[n-1] {
            return 1 + lcsHelper1(text1, m-1, text2, n-1)
        }
        return max(lcsHelper1(text1, m-1, text2, n), lcsHelper1(text1, m, text2, n-1))
    }
    
}
