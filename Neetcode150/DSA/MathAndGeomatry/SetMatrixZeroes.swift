//
//  SetMatrixZeroes.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 26/02/25.
//

//https://leetcode.com/problems/set-matrix-zeroes/
//https://neetcode.io/problems/set-zeroes-in-matrix
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
    
    // MARK: Time Complexity: O(m*n) || Space Compelxity: O(m+n)
    func setZeroes(_ matrix: inout [[Int]]) {
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
