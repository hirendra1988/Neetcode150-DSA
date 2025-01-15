//
//  RottingOranges.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 15/01/25.
//

//https://leetcode.com/problems/rotting-oranges/
//https://neetcode.io/problems/rotting-fruit
class RottingOranges {
    
    let emptyCell: Int = 0
    let freshOranges: Int = 1
    let rottenOranges: Int = 2
    
    init() {
        //        Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
        //        Output: 4
        runTest()
    }
    
    func runTest() {
        let grid = [[2,1,1],[1,1,0],[0,1,1]]
        let res = orangesRotting(grid)
        print(res)
    }
    
    // Time Complexity: O(rows*cols) || Space Compelxity: O(rows*cols)
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let directions = [[1,0],[-1,0],[0,1],[0,-1]]
        var queue = [(Int, Int)]()
        var freshOrangesCount = 0
        
        let rows = grid.count
        let cols = grid[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == rottenOranges {
                    queue.append((row, col))
                } else if grid[row][col] == freshOranges {
                    freshOrangesCount += 1
                }
            }
        }
        
        if freshOrangesCount == 0 {
            return 0
        }
        
        var time = 0
        while !queue.isEmpty {
            let n = queue.count
            var temp = 0
            for _ in 0..<n {
                let (row, col) = queue.removeFirst()
                for direction in directions {
                    let newRow = row + direction[0]
                    let newCol = col + direction[1]
                    
                    if newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols || grid[newRow][newCol] != freshOranges {
                        continue
                    }
                    temp += 1
                    grid[newRow][newCol] = rottenOranges
                    queue.append((newRow, newCol))
                }
            }
            if temp != 0 {
                time += 1
            }
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == freshOranges {
                    time = 0
                    break
                }
            }
        }
        
        return time == 0 ? -1 : time
        
    }
}
