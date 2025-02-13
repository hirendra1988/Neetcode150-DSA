//
//   EditDistance.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 13/02/25.
//

//https://leetcode.com/problems/edit-distance/
//https://neetcode.io/problems/edit-distance
//https://www.youtube.com/watch?v=HwDXH35lr0o
//https://www.youtube.com/watch?v=eMnyEDYGobA
class EditDistance {
    
    init() {
//        Input: word1 = "horse", word2 = "ros"
//        Output: 3
//        Explanation:
//        horse -> rorse (replace 'h' with 'r')
//        rorse -> rose (remove 'r')
//        rose -> ros (remove 'e')
        runTest()
    }
    
    func runTest() {
        let word1 = "horse", word2 = "ros"
        let res = minDistance(word1, word2)
        print(res)
    }
    
    // Time Complexity: O(rows*cols) || Space Compelxity: O(rows*cols)
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1Chars = Array(word1)
        let word2Chars = Array(word2)
        
        let rows = word2Chars.count
        let cols = word1Chars.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols + 1), count: rows + 1)
        
//        for i in 0...rows {
//            for j in 0...cols {
//                if i == 0 {
//                    dp[i][j] = j
//                } else if j == 0 {
//                    dp[i][j] = i
//                }
//            }
//        }
        
        // OR
        
        for i in 0...rows {
            for j in 0...cols {
                if i == 0 {
                    dp[i][j] = j
                } else if j == 0 {
                    dp[i][j] = i
                } else if word2Chars[i-1] == word1Chars[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = 1 + min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1])
                }
            }
        }
        return dp[rows][cols]
    }
    
}
