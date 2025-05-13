//
//  SetMatrixZeroes.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 26/02/25.
//

//https://leetcode.com/problems/set-matrix-zeroes/
//https://neetcode.io/problems/set-zeroes-in-matrix
//https://www.youtube.com/watch?v=dSxt3ZCbIqA
class SetMatrixZeroes {
    
    init() {
//        Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
//        Output: [[1,0,1],[0,0,0],[1,0,1]]
        runTest()
    }
    
    func runTest() {
        var matrix = [[1,1,1],[1,0,1],[1,1,1]]
        setZeroes(&matrix)
        print(matrix)
    }
    
    // MARK: Time Complexity: O(m*n) || Space Compelxity: O(1)
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        var firstRow = false
        var firstCol = false
        for row in 0..<rows {
            for col in 0..<cols {
                if matrix[row][col] == 0 {
                    if row == 0 {
                        firstRow = true
                    }
                    if col == 0 {
                        firstCol = true
                    }
                    matrix[0][col] = 0
                    matrix[row][0] = 0
                }
            }
        }
        
        for row in 1..<rows {
            for col in 1..<cols {
                if matrix[0][col] == 0 || matrix[row][0] == 0 {
                    matrix[row][col] = 0
                }
            }
        }
        
        if firstRow {
            for col in 0..<cols {
                matrix[0][col] = 0
            }
        }
        
        if firstCol {
            for row in 0..<rows {
                matrix[row][0] = 0
            }
        }
    }
    
    // MARK: Time Complexity: O(m*n) || Space Compelxity: O(1)
    func setZeroes2(_ matrix: inout [[Int]]) {
        var firstRowZero = false
        var firstColZero = false
        let rows = matrix.count
        let cols = matrix[0].count
        for col in 0..<cols {
            if matrix[0][col] == 0 {
                firstRowZero = true
                break
            }
        }
        
        for row in 0..<rows {
            if matrix[row][0] == 0 {
                firstColZero = true
                break
            }
        }
        
        for row in 1..<rows {
            for col in 1..<cols {
                if matrix[row][col] == 0 {
                    matrix[0][col] = 0
                    matrix[row][0] = 0
                }
            }
        }
        
        for row in 1..<rows {
            for col in 1..<cols {
                if matrix[0][col] == 0 || matrix[row][0] == 0 {
                    matrix[row][col] = 0
                }
            }
        }
        
        if firstRowZero {
            for col in 0..<cols {
                matrix[0][col] = 0
            }
        }
        
        if firstColZero {
            for row in 0..<rows {
                matrix[row][0] = 0
            }
        }
        
    }
    
    // MARK: Time Complexity: O(m*n) || Space Compelxity: O(m+n)
    func setZeroes1(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        var rowMap = [Bool](repeating: false, count: rows)
        var colMap = [Bool](repeating: false, count: cols)
        for i in 0..<rows {
            for j in 0..<cols {
                if matrix[i][j] == 0 {
                    rowMap[i] = true
                    colMap[j] = true
                }
            }
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                if rowMap[i] == true || colMap[j] == true {
                    matrix[i][j] = 0
                }
            }
        }
    }
    
}
