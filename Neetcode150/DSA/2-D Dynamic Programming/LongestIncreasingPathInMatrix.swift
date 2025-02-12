//
//  Longest IncreasingPathInMatrix.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 12/02/25.
//

//https://leetcode.com/problems/longest-increasing-path-in-a-matrix/
//https://neetcode.io/problems/longest-increasing-path-in-matrix
class LongestIncreasingPathInMatrix {
    var checkCount = 0
    init() {
//        Input: matrix = [[9,9,4],[6,6,8],[2,1,1]]
//        Output: 4
//        Explanation: The longest increasing path is [1, 2, 6, 9].
        runTest()
    }
    
    func runTest() {
        let matrix = [[9,9,4],[6,6,8],[2,1,1]]
        let res = longestIncreasingPath(matrix)
        print(res)
        print(checkCount)
    }
    
    //Time Complexity: O(rows*cols) || Space Compelxity: O(rows*cols)
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        var memo = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        for row in 0..<rows {
            for col in 0..<cols {
                memo[row][col] = dfs(matrix, row, col, -1, &memo)
            }
        }
        var longest = 1
        for i in 0..<memo.count {
            for j in 0..<memo[0].count {
                longest = max(longest, memo[i][j])
            }
        }
        return longest
    }
    
    func dfs(_ matrix: [[Int]], _ row: Int, _ col: Int, _ prev: Int, _ memo: inout [[Int]]) -> Int {
        checkCount += 1
        let rows = matrix.count
        let cols = matrix[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || matrix[row][col] <= prev {
            return 0
        }
        
        if memo[row][col] != 0 {
            return memo[row][col]
        }
        
        var res = 1
        res = max(res, 1 + dfs(matrix, row - 1, col, matrix[row][col], &memo))
        res = max(res, 1 + dfs(matrix, row + 1, col, matrix[row][col], &memo))
        res = max(res, 1 + dfs(matrix, row, col - 1, matrix[row][col], &memo))
        res = max(res, 1 + dfs(matrix, row, col + 1, matrix[row][col], &memo))
        
        memo[row][col] = res
        
        return res
    }
    
}
