//
//  TrappingRainWater.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/12/24.
//

//https://leetcode.com/problems/trapping-rain-water/
//https://neetcode.io/problems/trapping-rain-water
class TrappingRainWater {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let height = [0,1,0,2,1,0,1,3,2,1,2,1]
        let result = trap(height)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func trap(_ height: [Int]) -> Int {
        var leftMax = [Int](repeating: 0, count: height.count)
        leftMax[0] = height[0]
        
        var rightMax = [Int](repeating: 0, count: height.count)
        rightMax[height.count - 1] = height[height.count - 1]
        
        for i in 1..<height.count {
            leftMax[i] = max(leftMax[i-1], height[i])
        }
        
        for j in stride(from: height.count - 2, through: 0, by: -1) {
            rightMax[j] = max(rightMax[j+1], height[j])
        }

        var water = 0
        for k in 0..<height.count {
            let min = min(leftMax[k], rightMax[k])
            if min > height[k] {
                water += min - height[k]
            }
        }
        return water
    }
    
}
