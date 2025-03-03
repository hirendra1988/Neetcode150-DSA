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
    
}
