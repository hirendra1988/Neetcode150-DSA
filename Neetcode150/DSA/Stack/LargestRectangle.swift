//
//  LargestRectangle.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 21/12/24.
//

//https://leetcode.com/problems/largest-rectangle-in-histogram/
//https://neetcode.io/problems/largest-rectangle-in-histogram
class LargestRectangle {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let heights = [2,1,5,6,2,3]
        let res = largestRectangleArea(heights)
        print(res)
    }
    
    // Time Complexity: O(n^2) || Space Compelxity: O(1)
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.isEmpty {
            return 0
        }
        var maxArea = heights[0]
        for i in 0..<heights.count {
            var curArea = 1
            
            for j in stride(from: i, through: 1, by: -1) {
                if heights[j-1] >= heights[i] {
                    curArea = curArea + 1
                } else {
                    break
                }
            }
            for k in i..<heights.count - 1 {
                if heights[k+1] >= heights[i] {
                    curArea = curArea + 1
                } else {
                    break
                }
            }
            curArea = curArea * heights[i]
            maxArea = max(maxArea, curArea)
        }
        return maxArea
    }
    
}
