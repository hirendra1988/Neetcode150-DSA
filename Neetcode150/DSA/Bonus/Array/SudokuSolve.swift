//
//  SudokuSolve.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/07/25.
//

//37. Sudoku Solver
//https://leetcode.com/problems/sudoku-solver/description/
class SudokuSolve {
    
    init() {
        runTest()
    }
    
    func runTest() {
        var board: [[Character]] = [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"]
        ]
        solveSudoku(&board)
        print(board)
    }
    
    func solveSudoku(_ board: inout [[Character]]) {
        _ = backTracking(&board)
    }
    
    func backTracking(_ board: inout [[Character]]) -> Bool {
        let rows = board.count
        let cols = board[0].count
        for row in 0..<rows {
            for col in 0..<cols {
                if board[row][col] == "." {
                    for digit in "123456789" {
                        if validSudoku(&board, row, col, digit) {
                            board[row][col] = digit
                            if backTracking(&board) {
                                return true
                            }
                            board[row][col] = "."
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func validSudoku(_ board: inout [[Character]],
                     _ row: Int,
                     _ col: Int,
                     _ digit: Character) -> Bool {
        for i in 0..<9 {
            if board[row][i] == digit { return false }
            if board[i][col] == digit { return false }
            let currentRow = (row / 3) * 3 + i / 3
            let currentCol = (col / 3) * 3 + i % 3
            if board[currentRow][currentCol] == digit { return false }
        }
        return true
    }
    
    func validSudoku2(_ board: [[Character]], _ digit: Character, _ row: Int, _ col: Int) -> Bool {
        for i in 0..<9 {
            if board[row][i] == digit { return false } // row
            if board[i][col] == digit { return false } // col
        }
        let startRow = (row/3)*3
        let startCol = (col/3)*3
        for r in startRow..<startRow+3 {
            for c in startCol..<startCol+3 {
                if board[r][c] == digit { return false }
            }
        }
        return true
    }
    
}
