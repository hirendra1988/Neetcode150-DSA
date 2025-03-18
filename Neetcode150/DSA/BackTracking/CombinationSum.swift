//
//  CombinationSum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/03/25.
//

//https://www.youtube.com/watch?v=GBKI9VSKdGg
//https://leetcode.com/problems/combination-sum/
//https://neetcode.io/problems/combination-target-sum
class CombinationSum {
    
    init() {
        //        Input: candidates = [2,3,6,7], target = 7
        //        Output: [[2,2,3],[7]]
        //        Explanation:
        //        2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
        //        7 is a candidate, and 7 = 7.
        //        These are the only two combinations.
        runTest()
    }
    
    func runTest() {
        let candidates = [2,3,6,7], target = 7
        let res = combinationSum(candidates, target)
        print(res)
    }
    
    //Time Complexity: O(2^n) || Space Compelxity: O(n)
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        backTracking(candidates, target, &result, &tempSet, 0, 0)
        return result
    }
    
    func backTracking(_ candidates: [Int],
                      _ target: Int,
                      _ result: inout [[Int]],
                      _ tempSet: inout [Int],
                      _ startIndex: Int,
                      _ curSum: Int) {
        
        if curSum == target {
            result.append(tempSet)
            return
        }
        print(tempSet)
        
        for i in startIndex..<candidates.count {
            if curSum + candidates[i] > target {
                continue
            }
            
            tempSet.append(candidates[i])
            print(tempSet)
            backTracking(candidates, target, &result, &tempSet, i, curSum + candidates[i])
            print(tempSet)
            tempSet.removeLast()
            print(tempSet)
        }
    }
    
}
