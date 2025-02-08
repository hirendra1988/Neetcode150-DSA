//
//  Recursion.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/02/25.
//

class Recursion {
    
    init() {
        runTest()
    }
    // 0, 1, 1, 2, 3
    func runTest() {
        let n = 5
//        let res = fact(n: n)
//        print(res)
        
        print(fibonacci(n: n))
    }
    
    // MARK: Factorial
    func fact1(n: Int) -> Int {
        var fact = 1
        for i in 1...n {
            fact *= i
        }
        return fact
    }
    
    func fact(n: Int) -> Int {
        return factRecursion(n: n)
    }
    
    func factRecursion(n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        return factRecursion(n: n-1) * n
    }
    
    // MARK: Fibonacci Using Swapping
    func fibonacci1(n: Int) {
        if n == 0 || n == 1 {
            print("0", terminator: " ")
            return
        }
        var first = 0
        var second = 1
        for i in 0..<n {
            if i < 2 {
                print(i, terminator: " ")
                continue
            }
            let temp = first + second
            first = second
            second = temp
            print(temp, terminator: " ")
        }
    }
    
    func fibonacci11(n: Int) -> Int {
        return fibonacciRecursion(n: n)
    }
    
    // Recursive approcah
    func fibonacciRecursion(n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        return fibonacciRecursion(n: n-1) + fibonacciRecursion(n: n - 2)
    }
    
    // Memoization (Top Down) recursion + cache(storage)
    func fibonacci22(n: Int) -> Int {
        var dp = [Int](repeating: -1, count: n + 1)
        return fibonacciUsingMemoization(n: n, dp: &dp)
    }
    
    func fibonacciUsingMemoization(n: Int, dp: inout [Int]) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        
        // If already computed, return stored value
        if dp[n] != -1 {
            return dp[n]
        }
        
        dp[n] = fibonacciUsingMemoization(n: n-1, dp: &dp) + fibonacciUsingMemoization(n: n-2, dp: &dp)
        return dp[n]
    }
    
    
    // Tabulation (Bottom Up) // Only Cache(Storage)
    func fibonacci(n: Int) {
        if n == 0 || n == 1 {
            print("0", terminator: " ")
            return
        }
        
        if n == 2 {
            print("0", terminator: " ")
            print("1", terminator: " ")
            return
        }
        
        var dp = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        
        for i in 2...n {
            dp[i] = dp[i-2] + dp[i-1]
        }
        print(dp[n])
    }
    
}
