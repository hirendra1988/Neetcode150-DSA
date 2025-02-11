//
//  InterleavingString.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/02/25.
//

//https://leetcode.com/problems/interleaving-string/
//https://neetcode.io/problems/interleaving-string
//https://www.youtube.com/watch?v=t_2cFczxWCg
class InterleavingString {
    
    init() {
//        Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
//        Output: true
//        Explanation: One way to obtain s3 is:
//        Split s1 into s1 = "aa" + "bc" + "c", and s2 into s2 = "dbbc" + "a".
//        Interleaving the two splits, we get "aa" + "dbbc" + "bc" + "a" + "c" = "aadbbcbcac".
//        Since s3 can be obtained by interleaving s1 and s2, we return true.
        runTest()
    }
    
    func runTest() {
        let s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
        let res = isInterleave(s1, s2, s3)
        print(res)
    }
    
    // Using Memoization
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let m = s1.count, n = s2.count
        if m+n < s3.count {
            return false
        }
        var dp = [[Bool?]](repeating: [Bool?](repeating: nil, count: n + 1), count: m + 1)
        return isInterleaveHelper(Array(s1), Array(s2), Array(s3), 0, 0, 0, &dp)
    }
    
    func isInterleaveHelper(_ s1: [Character],
                            _ s2: [Character],
                            _ s3: [Character],
                            _ i: Int,
                            _ j: Int,
                            _ k: Int,
                            _ dp: inout [[Bool?]]) -> Bool {
        if i == s1.count && j == s2.count && k == s3.count {
            return true
        }
        if let cachedResult = dp[i][j] {
            return cachedResult
        }
        var x = false
        var y = false
        if i < s1.count && k < s3.count && s1[i] == s3[k] {
            x = isInterleaveHelper(s1, s2, s3, i+1, j, k+1, &dp)
        }
        if j < s2.count && k < s3.count && s2[j] == s3[k] {
            y = isInterleaveHelper(s1, s2, s3, i, j+1, k+1, &dp)
        }
        dp[i][j] = x || y
        return dp[i][j]!
    }
    
    // Using Recursion
    func isInterleave1(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        return isInterleaveHelper1(Array(s1), Array(s2), Array(s3), 0, 0, 0)
    }
    
    func isInterleaveHelper1(_ s1: [Character],
                      _ s2: [Character],
                      _ s3: [Character],
                      _ i: Int,
                      _ j: Int,
                      _ k: Int) -> Bool {
        if i == s1.count && j == s2.count && k == s3.count {
            return true
        }
        var x = false
        var y = false
        if i != s1.count && k != s3.count {
            if s1[i] == s3[k] {
                x = isInterleaveHelper1(s1, s2, s3, i+1, j, k+1)
            }
        }
        if j != s2.count && k != s3.count {
            if s2[j] == s3[k] {
                y = isInterleaveHelper1(s1, s2, s3, i, j+1, k+1)
            }
        }
        return x || y
    }
    
}
