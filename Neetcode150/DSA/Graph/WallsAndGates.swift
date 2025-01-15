//
//  WallsAndGates.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 15/01/25.
//

//https://leetcode.com/problems/walls-and-gates/description/
//https://neetcode.io/problems/islands-and-treasure
class WallsAndGates {
    
    let wall: Int = -1
    let gate: Int = 0
    let emptyRoom = 2147483647
    
    init() {
//        Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
//        Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
        runTest()
    }
    
    func runTest() {
        var rooms = [[2147483647,-1,0,2147483647],
                     [2147483647,2147483647,2147483647,-1],
                     [2147483647,-1,2147483647,-1],
                     [0,-1,2147483647,2147483647]]
        wallsAndGates(&rooms)
        print(rooms)
    }
    
    // Time Complexity: O(rows*cols) || Space Compelxity: O(rows*cols) (Optimal Approach)
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let directions = [[1,0],[-1,0],[0,1],[0,-1]]
        var queue = [(Int, Int)]()
        let rows = rooms.count
        let cols = rooms[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                if rooms[row][col] == gate {
                    queue.append((row, col))
                }
            }
        }
        
        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            
            for direction in directions {
                let newRow = row + direction[0]
                let newCol = col + direction[1]
                
                if newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols || rooms[newRow][newCol] != emptyRoom {
                    continue
                }
                rooms[newRow][newCol] = rooms[row][col] + 1
                queue.append((newRow, newCol))
            }
        }
    }
    
    // Time Complexity: O(rows*cols) || Space Compelxity: O(rows*cols)
    func wallsAndGates2(_ rooms: inout [[Int]]) {
        let rows = rooms.count
        let cols = rooms[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                if rooms[row][col] == gate {
                    dfs(&rooms, row - 1, col, gate + 1)
                    dfs(&rooms, row + 1, col, gate + 1)
                    dfs(&rooms, row, col - 1, gate + 1)
                    dfs(&rooms, row, col + 1, gate + 1)
                }
            }
        }
    }
    
    func dfs(_ rooms: inout [[Int]], _ row: Int, _ col: Int, _ value: Int) {
        if row < 0 || row >= rooms.count || col < 0 || col >= rooms[0].count {
            return
        }
        
        if rooms[row][col] == wall || rooms[row][col] == gate {
            return
        }
        
        if value >= rooms[row][col] {
            return
        }
        
        rooms[row][col] = value
        dfs(&rooms, row - 1, col, value + 1)
        dfs(&rooms, row + 1, col, value + 1)
        dfs(&rooms, row, col - 1, value + 1)
        dfs(&rooms, row, col + 1, value + 1)
    }
    
}
