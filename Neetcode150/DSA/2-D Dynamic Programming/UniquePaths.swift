//
//  UniquePaths.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 10/02/25.
//

// This Problem is same like Climbing Stairs
//https://leetcode.com/problems/unique-paths/
//https://neetcode.io/problems/count-paths
//https://www.youtube.com/watch?v=Ee-rJmkwaTM
class UniquePaths {
    
    init() {
        //        Input: m = 3, n = 7
        //        Output: 28
        runTest()
    }
    
    func runTest() {
        let m = 3, n = 7
        let result = uniquePaths(m, n)
        print(result)
    }
    
    // Using Tabulation
    // Time Complexity: O(m*n) || Space Compelxity: O(m*n)
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            return 1
        }
        var grid = Array(repeating: [Int](repeating: 0, count: n), count: m)
        for row in 0..<m {
            for col in 0..<n {
                if row == 0 || col == 0 {
                    grid[row][col] = 1
                } else {
                    grid[row][col] = grid[row-1][col] + grid[row][col-1]
                }
            }
        }
        return grid[m-1][n-1]
    }
    
    // Using Memoization
    // Time Complexity: O(m*n) || Space Compelxity: O(m*n)
    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            return 1
        }
        var grid = Array(repeating: [Int](repeating: 0, count: n), count: m)
        return uniquePathsHelper2(m, n, &grid)
    }
    
    func uniquePathsHelper2(_ m: Int, _ n: Int, _ grid: inout [[Int]]) -> Int {
        if m == 1 || n == 1 {
            return 1
        }
        if grid[m-1][n-1] != 0 {
            return grid[m-1][n-1]
        }
        grid[m-1][n-1] = uniquePathsHelper2(m-1, n, &grid) + uniquePathsHelper2(m, n-1, &grid)
        return grid[m-1][n-1]
    }
    
    // Using Recursion
    // Time Complexity: O(2^(m+n)) || Space Compelxity: O(m+n)
    func uniquePaths1(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            return 1
        }
        return uniquePaths(m-1, n) + uniquePaths(m, n-1)
    }
    
}
