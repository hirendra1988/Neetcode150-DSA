//
//  Subsets.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/03/25.
//

//https://leetcode.com/problems/subsets/
//https://neetcode.io/problems/subsets
//https://www.youtube.com/watch?v=taIvqOIT3cM
//https://www.youtube.com/watch?v=3tpjp5h3M6Y
class Subsets {
    
    init() {
//        Example 1:
//        Input: nums = [1,2,3]
//        Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
//
//        Example 2:
//        Input: nums = [0]
//        Output: [[],[0]]
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,3]
        let res = subsets(nums)
        print(res)
    }
    
    //Time Complexity: O(2^n) || Space Compelxity: O(n)
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        backTracking(nums, &result, &tempSet, 0)
        return result
    }
    
    func backTracking(_ nums: [Int], _ result: inout [[Int]], _ tempSet: inout [Int], _ startIndex: Int) {
        if startIndex == nums.count {
            result.append(tempSet)
            return
        }
        // Option 1: Exclude the current number
        backTracking(nums, &result, &tempSet, startIndex + 1)
        
        // Option 2: Include the current number
        tempSet.append(nums[startIndex])
        
        backTracking(nums, &result, &tempSet, startIndex + 1)
        
        // Undo the last step (Backtrack)
        tempSet.removeLast()
        
    }
    
    func backTracking1(_ nums: [Int], _ result: inout [[Int]], _ tempSet: inout [Int], _ startIndex: Int) {
        // ✅ Step 1: Add the current subset to the result
        result.append(tempSet)
        print(result)
        // 🔁 Step 2: Iterate from startIndex to the end of array
        for i in startIndex..<nums.count {
            
            // Including the number
            tempSet.append(nums[i])
            // Recursion to move forward with the next index
            backTracking(nums, &result, &tempSet, i + 1)
            
            // Not including the number
            // 🔙 Backtrack: Remove the last added element to explore the next option
            tempSet.removeLast()
        }
    }
    
}
