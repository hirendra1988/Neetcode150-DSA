//
//  SearchA2DMatrix.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 23/12/24.
//

//https://leetcode.com/problems/search-a-2d-matrix/
//https://neetcode.io/problems/search-2d-matrix
class SearchA2DMatrix {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
        //Output: true
        let res = searchMatrix(matrix, target)
        print(res)
    }

    // Time Complexity: O(log(n*m) || Space Compelxity: O(1)
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        let cols = matrix[0].count
        var left = 0
        var right = rows * cols - 1
        while left <= right {
            let mid = (left + right)/2
            let element = matrix[mid/cols][mid%cols]
            if element == target {
                return true
            }
            if element > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return false
    }
    
    // Time Complexity: O(m * log(n) || Space Compelxity: O(1)
    func searchMatrix1(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        let cols = matrix[0].count
        for row in 0..<rows {
            var left = 0
            var right = cols - 1
            while left <= right {
                let mid = (left + right)/2
                if matrix[row][mid] == target ||
                    matrix[row][left] == target ||
                    matrix[row][right] == target {
                    return true
                }
                if matrix[row][mid] > target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return false
    }
    
}
