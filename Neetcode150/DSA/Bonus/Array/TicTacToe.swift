//
//  TicTacToe.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 20/07/25.
//

//https://leetcode.com/problems/find-winner-on-a-tic-tac-toe-game/
class TicTacToe {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: moves = [[0,0],[2,0],[1,1],[2,1],[2,2]]
//        Output: "A"
        let moves = [[0,0],[2,0],[1,1],[2,1],[2,2]]
        print(tictactoe(moves))
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func tictactoe(_ moves: [[Int]]) -> String {
        let n = 3
        var player = 1
        var rows = [Int](repeating: 0, count: n)
        var cols = [Int](repeating: 0, count: n)
        
        var leftDiagonal = 0
        var rightDiagonal = 0
        
        for move in moves {
            let i = move[0]
            let j = move[1]
            rows[i] += player
            cols[j] += player
            
            if i == j {
                leftDiagonal += player
            }
            if i + j == n-1 {
                rightDiagonal += player
            }
            
            if abs(rows[i]) == 3 || abs(cols[j]) == 3 || abs(leftDiagonal) == 3 || abs(rightDiagonal) == 3 {
                return player == 1 ? "A" : "B"
            }
            player *= -1
        }
        
        return moves.count == 9 ? "Draw" : "Pending"
    }
    
    //Time Complexity: O(1) || Space Compelxity: O(1)
    func tictactoe2(_ moves: [[Int]]) -> String {
        let winConditions: [Set<[Int]>] = [
            [[0,0],[0,1],[0,2]], // row 0
            [[1,0],[1,1],[1,2]], // row 1
            [[2,0],[2,1],[2,2]], // row 2
            [[0,0],[1,0],[2,0]], // Column 0
            [[0,1],[1,1],[2,1]], // Column 1
            [[0,2],[1,2],[2,2]], // Column 2
            [[2,0],[1,1],[0,2]], // right diagonal
            [[0,0],[1,1],[2,2]]  // left diagonal
        ]
        
        var aPoints = Set<[Int]>()
        var bPoints = Set<[Int]>()
        
        for i in 0..<moves.count {
            if i % 2 == 0 {
                aPoints.insert(moves[i])
            } else {
                bPoints.insert(moves[i])
            }
        }
        
        for condition in winConditions {
            if condition.isSubset(of: aPoints) {
                return "A"
            }
            if condition.isSubset(of: bPoints) {
                return "B"
            }
        }
        
        return moves.count == 9 ? "Draw" : "Pending"
    }
    
}
