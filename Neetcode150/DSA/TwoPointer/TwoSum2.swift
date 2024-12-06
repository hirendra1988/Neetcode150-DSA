//
//  TwoSum2.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/12/24.
//

//https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
//https://neetcode.io/problems/two-integer-sum-ii
class TwoSum2 {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let numbers = [2,7,11,15], target = 9
        //Output: [1,2]
        let result = twoSum(numbers, target)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        
        while left <= right {
            if numbers[left] + numbers[right] == target {
                return [left+1, right+1]
            }
            
            if numbers[left] + numbers[right] > target {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return []
    }
    
}
