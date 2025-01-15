//
//  SurroundedRegions.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 15/01/25.
//

//https://leetcode.com/problems/surrounded-regions/
//https://neetcode.io/problems/surrounded-regions
class SurroundedRegions {
    
    init() {
        //        Input: board = [["X","X","X","X"],
        //                        ["X","O","O","X"],
        //                        ["X","X","O","X"],
        //                        ["X","O","X","X"]]
        //        Output: [["X","X","X","X"],
        //                 ["X","X","X","X"],
        //                 ["X","X","X","X"],
        //                 ["X","O","X","X"]]
        runTest()
    }
    
    func runTest() {
        var board: [[Character]] = [["X","X","X","X"],
                                    ["X","O","O","X"],
                                    ["X","X","O","X"],
                                    ["X","O","X","X"]]
        solve(&board)
        print(board)
    }
    
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        let cols = board[0].count
        for row in 0..<rows {
            for col in 0..<cols {
                if row * col == 0 || row == rows - 1 || col == cols - 1 {
                    if board[row][col] == "O" {
                        dfs(&board, row, col)
                    }
                }
            }
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                if board[row][col] == "O" {
                    board[row][col] = "X"
                } else if board[row][col] == "B" {
                    board[row][col] = "O"
                }
            }
        }
    }
    
    func dfs(_ board: inout [[Character]], _ row: Int, _ col: Int) {
        let rows = board.count
        let cols = board[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || board[row][col] != "O" {
            return
        }
        board[row][col] = "B"
        dfs(&board, row-1, col)
        dfs(&board, row+1, col)
        dfs(&board, row, col-1)
        dfs(&board, row, col+1)
    }
    
}
