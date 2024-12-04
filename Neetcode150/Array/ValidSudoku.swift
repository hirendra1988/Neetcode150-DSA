//
//  ValidSudoku.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/12/24.
//

class ValidSudoku {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let board: [[Character]] =
        [
            ["5","3",".",".","7",".",".",".","."],
            ["6",".",".","1","9","5",".",".","."],
            [".","9","8",".",".",".",".","6","."],
            ["8",".",".",".","6",".",".",".","3"],
            ["4",".",".","8",".","3",".",".","1"],
            ["7",".",".",".","2",".",".",".","6"],
            [".","6",".",".",".",".","2","8","."],
            [".",".",".","4","1","9",".",".","5"],
            [".",".",".",".","8",".",".","7","9"],
        ]
        
//        let board: [[Character]] =
//        [["8","3",".",".","7",".",".",".","."]
//         ,["6",".",".","1","9","5",".",".","."]
//         ,[".","9","8",".",".",".",".","6","."]
//         ,["8",".",".",".","6",".",".",".","3"]
//         ,["4",".",".","8",".","3",".",".","1"]
//         ,["7",".",".",".","2",".",".",".","6"]
//         ,[".","6",".",".",".",".","2","8","."]
//         ,[".",".",".","4","1","9",".",".","5"]
//         ,[".",".",".",".","8",".",".","7","9"]]
        
        let result = isValidSudoku(board)
        print(result)
    }
    
    // Time Complexity: O(n^2) || Space Compelxity: O(n)
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let rows = board.count
        let cols = board[0].count
        var hashMap = [Character: Int]()
        for row in 0..<rows {
            hashMap.removeAll()
            for col in 0..<cols {
                if board[row][col] != "." {
                    hashMap[board[row][col], default: 0] += 1
                }
                if hashMap[board[row][col]] ?? 0 > 1 {
                    return false
                }
            }
        }
        
        for row in 0..<rows {
            hashMap.removeAll()
            for col in 0..<cols {
                if board[col][row] != "." {
                    hashMap[board[col][row], default: 0] += 1
                }
                if hashMap[board[col][row]] ?? 0 > 1 {
                    return false
                }
            }
        }
        
        for grid in 0..<9 {
            let startRow = (grid / 3) * 3
            let startCol = (grid % 3) * 3
            hashMap.removeAll()
            for row in startRow..<startRow + 3 {
                for col in startCol..<startCol + 3 {
                    if board[row][col] != "." {
                        hashMap[board[row][col], default: 0] += 1
                    }
                    if hashMap[board[row][col]] ?? 0 > 1 {
                        return false
                    }
                }
            }
        }
        
        return true
    }
    
}
