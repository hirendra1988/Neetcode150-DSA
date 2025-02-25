//
//  RotateImage.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 25/02/25.
//

//https://leetcode.com/problems/rotate-image/
//https://neetcode.io/problems/rotate-matrix
//https://www.youtube.com/watch?v=Ux058jpRB9Y
class RotateImage {
    
    init() {
//        Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
//        Output: [[7,4,1],[8,5,2],[9,6,3]]
        runTest()
    }
    
    func runTest() {
        var matrix = [[1,2,3],[4,5,6],[7,8,9]]
        rotate(&matrix)
        print(matrix)
    }
    
    func rotate(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix.count
        for row in 0..<(rows + 1)/2 {
            for col in 0..<cols/2 {
                // temp = bottom left
                let temp = matrix[cols - col - 1][row]
                // bottom left = bottom right
                matrix[cols - col - 1][row] = matrix[rows - row - 1][cols - col - 1]
                // bottom right = top right
                matrix[rows - row - 1][cols - col - 1] = matrix[col][rows - row - 1]
                // top right = top left
                matrix[col][rows - row - 1] = matrix[row][col]
                // top left = temp
                matrix[row][col] = temp
            }
        }
    }
    
    // MARK: Time Complexity: O(m*n) || Space Compelxity: O(m*n)
    func rotate2(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        var result = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        for col in stride(from: cols - 1, through: 0, by: -1) {
            for row in 0..<rows {
                result[row][col] = matrix[cols - col - 1][row]
            }
        }
        matrix = result
    }
    
}
