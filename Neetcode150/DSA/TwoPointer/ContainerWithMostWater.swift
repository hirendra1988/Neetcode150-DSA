//
//  ContainerWithMostWater.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/12/24.
//

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
    
    func maxArea(_ height: [Int]) -> Int {
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
