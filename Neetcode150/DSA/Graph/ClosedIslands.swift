//
//  ClosedIslands.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 18/11/25.
//

//https://leetcode.com/problems/number-of-closed-islands/
//https://www.youtube.com/watch?v=JJ5FxoLckMw&t=856s
class ClosedIslands {
    
    init() {
        runTest()
    }
    
    //    Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
    //    Output: 2
    func runTest() {
        let grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
        print(closedIsland(grid))
    }
    
    func closedIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 0 {
                    if row * col == 0 || row == rows - 1 || col == cols - 1 {
                        dfs(&grid, row, col)
                    }
                }
            }
        }
        
        var count = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 0 {
                    dfs(&grid, row, col)
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func dfs(_ grid: inout [[Int]], _ row: Int, _ col: Int) {
        let rows = grid.count
        let cols = grid[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || grid[row][col] == 1 {
            return
        }
        grid[row][col] = 1
        dfs(&grid, row+1, col)
        dfs(&grid, row-1, col)
        dfs(&grid, row, col+1)
        dfs(&grid, row, col-1)
    }
    
}
