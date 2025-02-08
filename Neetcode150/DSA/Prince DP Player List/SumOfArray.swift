//
//  SumOfArray.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/02/25.
//

//https://www.youtube.com/watch?v=LLTo_qr4QRU&list=PLzjZaW71kMwSsCT23GFQ-xykAz4uUtYjW&index=3
class SumOfArray {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let array = [1,2,3,4]
        let res = sumOfArray(array)
        print(res)
    }
    
    // Simple Way
    func sumOfArray1(_ arr: [Int]) -> Int {
        var sum = 0
        for num in arr {
            sum += num
        }
        return sum
    }
    
    // ------------------------------------------------------------------------------
    // Using Recursion
    func sumOfArray2(_ arr: [Int]) -> Int {
        return sumOfArrayRecursion(arr, arr.count)
    }
    
    func sumOfArrayRecursion(_ arr: [Int], _ index: Int) -> Int {
        if index == 0 {
            return 0
        }
        return arr[index-1] + sumOfArrayRecursion(arr, index - 1)
    }
    
    // ------------------------------------------------------------------------------
    // Using DP (Tabulation)
    func sumOfArray3(_ arr: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: arr.count + 1)
        return sumOfArrayWithDPTabulation(arr, &dp)
    }
    
    func sumOfArrayWithDPTabulation(_ arr: [Int], _ dp: inout [Int]) -> Int {
        for i in 1...arr.count {
            dp[i] = dp[i-1] + arr[i-1]
        }
        return dp[arr.count]
    }
    // ------------------------------------------------------------------------------
    
    // ------------------------------------------------------------------------------
    // Using DP (memoization)
    func sumOfArray(_ arr: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: arr.count + 1)
        return sumOfArrayWithDPMemoization(arr, &dp, arr.count)
    }
    
    func sumOfArrayWithDPMemoization(_ arr: [Int], _ dp: inout [Int], _ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if dp[n] != 0 {
            return dp[n]
        }
        
        dp[n] = arr[n-1] + sumOfArrayWithDPMemoization(arr, &dp, n-1)
        return dp[n]
    }
    
}
