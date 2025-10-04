//
//  NQueens.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/03/25.
//

//https://leetcode.com/problems/n-queens/
//https://neetcode.io/problems/n-queens
//https://www.youtube.com/watch?v=Ph95IHmRp5M
class NQueens {
    
    init() {
        //        Input: n = 4
        //        Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
        //        Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above
        runTest()
    }
    
    func runTest() {
        let n = 4
        let res = solveNQueens(n)
        print(res)
    }
    
    //Time Complexity: O(n!) || Space Compelxity: O(n)
    func solveNQueens(_ n: Int) -> [[String]] {
        var cols = Set<Int>()
        var posDiagnal = Set<Int>() // r + c
        var negDiagnal = Set<Int>() // r - c
        var res = [[String]]()
        var board = [[String]](repeating: [String](repeating: ".", count: n), count: n)
        backTracking(n, &cols, &posDiagnal, &negDiagnal, &res, &board, 0)
        return res
    }
    
    func backTracking(_ n: Int,
                      _ cols: inout Set<Int>,
                      _ posDiagnal: inout Set<Int>,
                      _ negDiagnal: inout Set<Int>,
                      _ res: inout [[String]],
                      _ board: inout [[String]], _ r: Int) {
        
        if r == n {
            let boardCopy = board.map { $0.joined() }
            res.append(boardCopy)
            return
        }
        
        for c in 0..<n {
            if cols.contains(c) || posDiagnal.contains(r+c) || negDiagnal.contains(r-c) {
                continue
            }
            cols.insert(c)
            posDiagnal.insert(r+c)
            negDiagnal.insert(r-c)
            board[r][c] = "Q"
            backTracking(n, &cols, &posDiagnal, &negDiagnal, &res, &board, r+1)
            cols.remove(c)
            posDiagnal.remove(r+c)
            negDiagnal.remove(r-c)
            board[r][c] = "."
        }
    }
    
    func solveNQueens2(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var board = [[Character]](repeating: [Character](repeating: ".", count: n), count: n)
        backTracking(&board, n, 0, &result)
        return result
    }
    
    func backTracking(_ board: inout [[Character]], _ n: Int, _ row: Int, _ result: inout [[String]]) {
        if row == n {
            result.append(board.map { String($0) })
            return
        }
        for col in 0..<n {
            if isValid(row, col, board) {
                board[row][col] = "Q"
                backTracking(&board, n, row+1, &result)
                board[row][col] = "."
            }
        }
    }
    
    func isValid(_ row: Int, _ col: Int, _ board: [[Character]]) -> Bool {
        // check column
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // check upper-left diagonal
        var r = row - 1
        var c = col - 1
        while r >= 0, c >= 0 {
            if board[r][c] == "Q" {
                return false
            }
            r -= 1
            c -= 1
        }
        
        // check upper-right diagonal
        r = row - 1
        c = col + 1
        while r >= 0, c < board.count {
            if board[r][c] == "Q" {
                return false
            }
            r -= 1
            c += 1
        }
        return true
    }
    
}
