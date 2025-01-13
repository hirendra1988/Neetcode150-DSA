//
//  MaxAreaOfIsland.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 13/01/25.
//

//https://leetcode.com/problems/max-area-of-island/
//https://neetcode.io/problems/max-area-of-island
class MaxAreaOfIsland {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
        //        Output: 6
        //        Explanation: The answer is not 11, because the island must be connected 4-directionally.
        let res = maxAreaOfIsland(grid)
        print(res)
    }
    
    // Time Complexity: O(rows*cols) || Space Compelxity: O(rows*cols)
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        var maxArea = 0
        for row in 0..<rows {
            for col in 0..<cols {
                if !visited[row][col] && grid[row][col] == 1 {
                    var area = 0
                    dfs(&grid, &visited, row, col, &area)
                    maxArea = max(maxArea, area)
                }
            }
        }
        return maxArea
    }
    
    func dfs(_ grid: inout [[Int]], _ visited: inout [[Bool]], _ row: Int, _ col: Int, _ area: inout Int) {
        let rows = grid.count
        let cols = grid[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || grid[row][col] == 0 {
            return
        }
        grid[row][col] = 0
        if !visited[row][col] {
            visited[row][col] = true
            area += 1
            dfs(&grid, &visited, row-1, col, &area)
            dfs(&grid, &visited, row+1, col, &area)
            dfs(&grid, &visited, row, col-1, &area)
            dfs(&grid, &visited, row, col+1, &area)
        }
    }
    
}
