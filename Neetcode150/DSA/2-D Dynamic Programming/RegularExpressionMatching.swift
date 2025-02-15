//
//  RegularExpressionMatching.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 15/02/25.
//

//https://leetcode.com/problems/regular-expression-matching/
//https://neetcode.io/problems/regular-expression-matching
//https://www.youtube.com/watch?v=HAA8mgxlov8
class RegularExpressionMatching {
    
    init() {
//        Input: s = "aa", p = "a"
//        Output: false
//        Explanation: "a" does not match the entire string "aa".
        runTest()
    }
    
    func runTest() {
        let s = "aa", p = "a*"
        let result = isMatch(s, p)
        print(result)
    }
    
    // Using Memoization
    //Time Complexity: O(s*p), Space Complexity :O(s*p)
    func isMatch(_ s: String, _ p: String) -> Bool {
        var dp = [[Bool?]](repeating: [Bool?](repeating: nil, count: p.count + 1), count: s.count + 1)
        return dfs(Array(s), Array(p), 0, 0, &dp)
    }
    
    func dfs(_ sChars: [Character],
             _ pChars: [Character],
             _ i: Int,
             _ j: Int,
             _ dp: inout [[Bool?]]) -> Bool {
        
        if dp[i][j] != nil {
            return dp[i][j]!
        }
        
        if i >= sChars.count && j >= pChars.count {
            return true
        }
        if j >= pChars.count {
            return false
        }
        
        let match = (i < sChars.count) && (sChars[i] == pChars[j] || pChars[j] == ".")
        if j+1 < pChars.count, pChars[j+1] == "*" {
            dp[i][j] = dfs(sChars, pChars, i, j+2, &dp) // don't use *
            || match && dfs(sChars, pChars, i+1, j, &dp) // use *
            return dp[i][j]!
        }
        if match {
            dp[i][j] = dfs(sChars, pChars, i+1, j+1, &dp)
            return dp[i][j]!
        }
        return false
    }
    
    
    // Using Recursion
    //Time Complexity: O(2^(s+p)), Space Complexity :O(s*p)
    func isMatch1(_ s: String, _ p: String) -> Bool {
        return dfs1(Array(s), Array(p), 0, 0)
    }
    
    func dfs1(_ sChars: [Character], _ pChars: [Character], _ i: Int, _ j: Int) -> Bool {
        if i >= sChars.count && j >= pChars.count {
            return true
        }
        if j >= pChars.count {
            return false
        }
        let match = (i < sChars.count) && (sChars[i] == pChars[j] || pChars[j] == ".")
        if j+1 < pChars.count, pChars[j+1] == "*" {
            return dfs1(sChars, pChars, i, j+2) // don't use *
            || match && dfs1(sChars, pChars, i+1, j) // use *
        }
        if match {
            return dfs1(sChars, pChars, i+1, j+1)
        }
        return false
    }
    
}
