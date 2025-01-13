//
//  NumberOfIslands.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 13/01/25.
//

//https://leetcode.com/problems/number-of-islands/
//https://neetcode.io/problems/count-number-of-islands
class NumberOfIslands {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let grid: [[Character]] = [
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
        ]
        //Output: 3
        let res = numIslands(grid)
        print(res)
    }
    
    // Time Complexity: O(rows*cols) || Space Compelxity: O(rows*cols)
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        var result = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if !visited[row][col] && grid[row][col] == "1" {
                    result += 1
                    dfs(&grid, row, col, &visited)
                }
            }
        }
        return result
    }
    
    func dfs(_ grid: inout [[Character]], _ row: Int, _ col: Int, _ visited: inout [[Bool]]) {
        let rows = grid.count
        let cols = grid[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || grid[row][col] == "0" {
            return
        }
        grid[row][col] = "0"
        if !visited[row][col] {
            visited[row][col] = true
            dfs(&grid, row-1, col, &visited)
            dfs(&grid, row+1, col, &visited)
            dfs(&grid, row, col-1, &visited)
            dfs(&grid, row, col+1, &visited)
        }
    }
    
}
