//
//  SwimRisingWater.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 22/01/25.
//

//https://leetcode.com/problems/swim-in-rising-water/
//https://neetcode.io/problems/swim-in-rising-water/
//https://www.youtube.com/watch?v=z-6f0KkSbvU&t=51s
class SwimRisingWater {
    
    init() {
//        Input: grid = [[0,2],[1,3]]
//        Output: 3
//        Explanation:
//        At time 0, you are in grid location (0, 0).
//        You cannot go anywhere else because 4-directionally adjacent neighbors have a higher elevation than t = 0.
//        You cannot reach point (1, 1) until time 3.
//        When the depth of water is 3, we can swim anywhere inside the grid.
        runTest()
    }
    
    func runTest() {
        let grid = [[0,2],[1,3]]
        let result = swimInWater(grid)
        print(result)
    }
    
    //Time Complexity: O(n^2logn) || Space Compelxity: O(n^2)
    func swimInWater(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var left = 0
        var right = n * n - 1
        
        while left <= right {
            let mid = (left + right) / 2
            if dfs(mid, grid) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    func dfs(_ waterLevel: Int, _ grid: [[Int]]) -> Bool {
        if grid[0][0] > waterLevel {
            return false
        }
        let n = grid.count
        let directions = [[1,0],[0,1],[-1,0],[0,-1]]
        var queue = [(Int, Int)]()
        queue.append((0, 0))
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        visited[0][0] = true
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            let row = first.0
            let col = first.1
            
            if row == n - 1 && col == n - 1 {
                return true
            }
            
            for direction in directions {
                let newRow = row + direction[0]
                let newCol = col + direction[1]
                
                if newRow < 0 || newRow >= n || newCol < 0 ||
                    newCol >= n || visited[newRow][newCol] || grid[newRow][newCol] > waterLevel {
                    continue
                }
                visited[newRow][newCol] = true
                queue.append((newRow, newCol))
            }
            
        }
        
        return false
    }
    
}























k


