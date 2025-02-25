//
//  SpiralMatrix.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 25/02/25.
//

//https://leetcode.com/problems/spiral-matrix/
//https://neetcode.io/problems/spiral-matrix
class SpiralMatrix {
    
    init() {
        //        Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
        //        Output: [1,2,3,6,9,8,7,4,5]
        runTest()
    }
    
    func runTest() {
        let matrix = [[1,2,3],[4,5,6],[7,8,9]]
        let res = spiralOrder(matrix)
        print(res)
    }
    
    // MARK: Time Complexity: O(m*n) || Space Compelxity: O(1)
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var startRow = 0
        var endRow = matrix.count - 1
        var startCol = 0
        var endCol = matrix[0].count - 1
        var result = [Int]()
        while startRow <= endRow, startCol <= endCol {
            for col in startCol..<endCol+1 {
                result.append(matrix[startRow][col])
            }
            for row in startRow+1..<endRow+1 {
                result.append(matrix[row][endCol])
            }
            
            if startRow == endRow || startCol == endCol {
                break
            }
            
            for col in stride(from: endCol-1, through: startCol, by: -1) {
                result.append(matrix[endRow][col])
            }
            
            for row in stride(from: endRow - 1, through: startRow + 1, by: -1) {
                result.append(matrix[row][startCol])
            }
            
            startRow += 1
            startCol += 1
            endRow -= 1
            endCol -= 1
        }
        
        return result
    }
    
}
