//
//  DecodeWays.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/02/25.
//

//https://leetcode.com/problems/decode-ways/
//https://neetcode.io/problems/decode-ways
class DecodeWays {
    
    init() {
//        Input: s = "12"
//        Output: 2
//        Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).
        runTest()
    }
    
    func runTest() {
        let s = "12"
        let res = numDecodings(s)
        print(res)
    }
    
    // Using Memoization
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func numDecodings(_ s: String) -> Int {
        let sChars = Array(s)
        var memo = [Int](repeating: 0, count: sChars.count + 1)
        return numDecodingsHelper(sChars, 0, &memo)
    }
    
    func numDecodingsHelper(_ sChars: [Character], _ index: Int, _ memo: inout [Int]) -> Int {
        if index == sChars.count {
            return 1
        }
        if sChars[index] == "0" {
            return 0
        }
        
        if memo[index] != 0 {
            return memo[index]
        }
        
        var count = numDecodingsHelper(sChars, index + 1, &memo)
        if index < sChars.count - 1 {
            let num = Int(String(sChars[index...index+1])) ?? 0
            if num >= 10, num <= 26 {
                count += numDecodingsHelper(sChars, index + 2, &memo)
            }
        }
        memo[index] = count
        return count
    }
    
    // Using Normal Recursion
    func numDecodings3(_ s: String) -> Int {
        let sChars = Array(s)
        return numDecodingsHelper3(sChars, 0)
    }
    
    func numDecodingsHelper3(_ sChars: [Character], _ index: Int) -> Int {
        if index == sChars.count {
            return 1
        }
        if sChars[index] == "0" {
            return 0
        }
        var count = numDecodingsHelper3(sChars, index + 1)
        if index < sChars.count - 1 {
            let num = Int(String(sChars[index...index+1])) ?? 0
            if num >= 10, num <= 26 {
                count += numDecodingsHelper3(sChars, index + 2)
            }
        }
        return count
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func numDecodings1(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        let n = s.count
        let sChars = Array(s)
        var dp = [Int](repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = sChars[0] == "0" ? 0 : 1
        
        if n == 1 {
            return dp[1]
        }
        
        for i in 2...n {
            if let first = Int(String(sChars[i-1])), first >= 1 {
                dp[i] += dp[i-1]
            }
            if let second = Int(String(sChars[i-2...i-1])), second >= 10, second <= 26 {
                dp[i] += dp[i-2]
            }
        }
        return dp[n]
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func numDecodings2(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        let sChars = Array(s)
        let n = sChars.count
        
        var first = 1  // dp[i-2] (Base case)
        var second = sChars[0] == "0" ? 0 : 1 // dp[i-1]
        var curr = second  // Stores dp[i]
        
        if n == 1 { return second }
        
        for i in 2...n {
            curr = 0 // Reset current count
            
            if let first = Int(String(sChars[i-1])), first >= 1 {
                curr += second
            }
            
            if let second = Int(String(sChars[i-2...i-1])), second >= 10, second <= 26 {
                curr += first
            }
            
            // Shift values for next iteration
            first = second
            second = curr
        }
        
        return curr
    }
    
}
