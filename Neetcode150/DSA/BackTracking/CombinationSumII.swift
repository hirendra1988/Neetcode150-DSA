//
//  CombinationSumII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/03/25.
//

//https://leetcode.com/problems/combination-sum-ii/
//https://neetcode.io/problems/combination-target-sum-ii
class CombinationSumII {
    
    init() {
//        Input: candidates = [10,1,2,7,6,1,5], target = 8
//        Output:
//        [[1,1,6],
//        [1,2,5],
//        [1,7],
//        [2,6]]
        runTest()
    }
    
    func runTest() {
        let candidates = [10,1,2,7,6,1,5], target = 8
        let res = combinationSum2(candidates, target)
        print(res)
    }
    
    //Time Complexity: O(2^n + nlogn) || Space Compelxity: O(n)
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var tempSet = [Int]()
        let sortedCandidates = candidates.sorted()
        backTracking(sortedCandidates, target, &result, &tempSet, 0, 0)
        return result
    }
    
    func backTracking(_ candidates: [Int],
                      _ target: Int,
                      _ result: inout [[Int]],
                      _ tempSet: inout [Int],
                      _ curSum: Int,
                      _ startIndex: Int) {
        if curSum == target {
            result.append(tempSet)
            return
        }
        for i in startIndex..<candidates.count {
            if i > startIndex, candidates[i] == candidates[i-1] {
                continue
            }
            if curSum + candidates[i] > target {
                break
            }
            tempSet.append(candidates[i])
            backTracking(candidates, target, &result, &tempSet, curSum + candidates[i], i + 1)
            tempSet.removeLast()
        }
    }
    
}
