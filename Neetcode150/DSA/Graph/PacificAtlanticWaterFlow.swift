//
//  PacificAtlanticWaterFlow.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/01/25.
//

//https://leetcode.com/problems/pacific-atlantic-water-flow/
//https://neetcode.io/problems/pacific-atlantic-water-flow
class PacificAtlanticWaterFlow {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
//        Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
        let heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
        let res = pacificAtlantic(heights)
        print(res)
    }
    
    // Time Complexity: O(rows*cols) || Space Compelxity: O(rows*cols)
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        if heights.count == 0 {
            return [[Int]]()
        }
        
        let rows = heights.count
        let cols = heights[0].count
        
        var pacificVisit = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        var atlanticVisit = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        
        // top bottom
        for col in 0..<cols {
            dfs(heights, 0, col, Int.min, &pacificVisit) // Pacific: Top row
            dfs(heights, rows - 1, col, Int.min, &atlanticVisit) // Atlantic: Bottom row
        }
        
        for row in 0..<rows {
            dfs(heights, row, 0, Int.min, &pacificVisit) // Pacific: Left column
            dfs(heights, row, cols - 1, Int.min, &atlanticVisit) // Atlantic: Right column
        }
        
        var list = [[Int]]()
        
        for row in 0..<rows {
            for col in 0..<cols {
                if pacificVisit[row][col] && atlanticVisit[row][col] {
                    list.append([row, col])
                }
            }
        }
        
        return list
    }
    
    func dfs(_ heights: [[Int]], _ row: Int, _ col: Int, _ prevHeight: Int, _ ocean: inout [[Bool]]) {
        let rows = heights.count
        let cols = heights[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || ocean[row][col] == true || heights[row][col] < prevHeight {
            return
        }
        ocean[row][col] = true
        dfs(heights, row - 1, col, heights[row][col], &ocean)
        dfs(heights, row + 1, col, heights[row][col], &ocean)
        dfs(heights, row, col - 1, heights[row][col], &ocean)
        dfs(heights, row, col + 1, heights[row][col], &ocean)
    }
    
}
