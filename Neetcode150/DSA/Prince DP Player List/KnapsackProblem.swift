//
//  KnapsackProblem.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 10/02/25.
//

// 0-1 Knapsack problem
//https://www.youtube.com/watch?v=3hBAsP-rd38
//https://www.youtube.com/watch?v=kJQD4UxNXZE&list=PLzjZaW71kMwSsCT23GFQ-xykAz4uUtYjW&index=21
class KnapsackProblem {
    
    init() {
//        Input: arr[] = [3, 34, 4, 12, 5, 2], target = 9
//        Output: true
//        Explanation: Here there exists a subset with target sum = 9, 4+3+2 = 9.
        runTest()
    }
    
    func runTest() {
        let arr = [3, 34, 4, 12, 5, 2], target = 9
        let res = subsetSum(arr, target)
        print(res)
    }
    
    // using DP (memoization)
    func subsetSum(_ arr: [Int], _ sum: Int) -> Bool {
        var memo: [[Bool?]] = Array(repeating: [Bool?](repeating: nil, count: sum + 1), count: arr.count + 1)
        return subsetSumHelper(arr, sum, arr.count, &memo)
    }
    
    func subsetSumHelper(_ arr: [Int], _ sum: Int, _ n: Int, _ memo: inout [[Bool?]]) -> Bool {
        if n == 0 {
            return false
        }
        if sum == 0 {
            return true
        }
        
        if let res = memo[n][sum] {
            return res
        }
        
        if arr[n-1] <= sum {
            memo[n][sum] = subsetSumHelper(arr, sum - arr[n-1], n-1, &memo) || subsetSumHelper(arr, sum, n-1, &memo)
        } else {
            memo[n][sum] = subsetSumHelper(arr, sum, n-1, &memo)
        }
        return memo[n][sum]!
    }
    
    // Using Recursion
    func subsetSum1(_ arr: [Int], _ sum: Int) -> Bool {
        return subsetSumHelper1(arr, sum, arr.count)
    }
    
    func subsetSumHelper1(_ arr: [Int], _ sum: Int, _ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        if sum == 0 {
            return true
        }
        if arr[n-1] <= sum {
            return subsetSumHelper1(arr, sum - arr[n-1], n-1) || subsetSumHelper1(arr, sum, n-1)
        }
        return subsetSumHelper1(arr, sum, n-1)
    }
    
}
