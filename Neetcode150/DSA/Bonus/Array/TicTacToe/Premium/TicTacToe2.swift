//
//  TicTacToe2.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 28/10/25.
//

import Foundation

//https://leetcode.com/problems/design-tic-tac-toe/

class TicTacToe2 {
    
    var n: Int
    var rows: [Int]
    var cols: [Int]
    var leftDiagonal: Int = 0
    var rightDiagonal: Int = 0
    
    init(_ n: Int) {
        self.n = n
        self.rows = [Int](repeating: 0, count: n)
        self.cols = [Int](repeating: 0, count: n)
        
        runTest()
    }
    
//    Input
//    ["TicTacToe", "move", "move", "move", "move", "move", "move", "move"]
//    [[3], [0, 0, 1], [0, 2, 2], [2, 2, 1], [1, 1, 2], [2, 0, 1], [1, 0, 2], [2, 1, 1]]

//    Output: [null, 0, 0, 0, 0, 0, 0, 1]

    func runTest() {
        let move1 = move(0, 0, 1)
        let move2 = move(0, 2, 2)
        let move3 = move(2, 2, 1)
        let move4 = move(1, 1, 2)
        let move5 = move(2, 0, 1)
        let move6 = move(1, 0, 2)
        let move7 = move(2, 1, 1)
       
        print([move1, move2, move3, move4, move5, move6, move7])
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let playerMove = player == 1 ? 1 : -1
        
        rows[row] += playerMove
        cols[col] += playerMove
        
        if row == col {
            leftDiagonal += playerMove
        }
        if row + col == n - 1 {
            rightDiagonal += playerMove
        }
        
        if abs(rows[row]) == 3 || abs(cols[col]) == 3 || abs(leftDiagonal) == 3 || abs(rightDiagonal) == 3 {
            return playerMove == 1 ? 1 : 2
        }
        
        return 0
    }
    
}
