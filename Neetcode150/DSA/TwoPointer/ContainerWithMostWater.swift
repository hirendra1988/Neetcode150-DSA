//
//  ContainerWithMostWater.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/12/24.
//

//https://leetcode.com/problems/container-with-most-water/
//https://neetcode.io/problems/max-water-container
//https://www.youtube.com/watch?v=w7ftYsZtIbs
class ContainerWithMostWater {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let height = [1,8,6,2,5,4,8,3,7]
        //Output: 49
        let result = maxArea(height)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func maxArea(_ height: [Int]) -> Int {
        if height.isEmpty {
            return 0
        }
        var maxArea = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            let area = min(height[left], height[right]) * (right - left)
            maxArea = max(maxArea, area)
            
            if height[left] <= height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
    
}
