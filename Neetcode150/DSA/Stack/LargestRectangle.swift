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
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]()
        var prevSmallest = [Int](repeating: 0, count: heights.count)
        
        for i in 0..<heights.count {
            while !stack.isEmpty, heights[stack.last!] >= heights[i] {
                stack.removeLast()
            }
            if !stack.isEmpty {
                prevSmallest[i] = stack.last! + 1
            }
            stack.append(i)
        }
        
        var nextSmallest = [Int](repeating: 0, count: heights.count)
        stack = [Int]()
        
        for j in stride(from: heights.count - 1, through: 0, by: -1) {
            while !stack.isEmpty, heights[stack.last!] >= heights[j] {
                stack.removeLast()
            }
            if !stack.isEmpty {
                nextSmallest[j] = stack.last! - 1
            } else {
                nextSmallest[j] = heights.count - 1
            }
            stack.append(j)
        }
        var maxArea = 0
        for k in 0..<heights.count {
            let curArea = (nextSmallest[k] - prevSmallest[k] + 1) * heights[k]
            maxArea = max(maxArea, curArea)
        }
        return maxArea
    }
    
    // Time Complexity: O(n^2) || Space Compelxity: O(1)
    func largestRectangleArea2(_ heights: [Int]) -> Int {
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
