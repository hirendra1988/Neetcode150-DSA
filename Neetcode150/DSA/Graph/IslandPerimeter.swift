//
//  IslandPerimeter.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 15/11/25.
//

//https://leetcode.com/problems/island-perimeter/
//https://neetcode.io/problems/island-perimeter?list=neetcode250
//https://www.youtube.com/watch?v=zb9VpguSrcE
class IslandPerimeter {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
        print(islandPerimeter(grid))
    }
    
//    Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
//    Output: 16
    // Time Complexity: O(rows*cols) || Space Compelxity: O(1)
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var result = 0
        let rows = grid.count
        let cols = grid[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    // Up
                    if row > 0 && (grid[row-1][col] == 0) || row == 0 {
                        result += 1
                    }
                    
                    // Bottom
                    if (row < rows - 1) && (grid[row+1][col] == 0) || row == rows - 1 {
                        result += 1
                    }
                    
                    // Left
                    if col > 0 && grid[row][col-1] == 0 || col == 0 {
                        result += 1
                    }
                    
                    // Right
                    if col < cols - 1 && grid[row][col+1] == 0 || col == cols - 1 {
                        result += 1
                    }
                    
                }
            }
        }
        return result
    }
    
}
