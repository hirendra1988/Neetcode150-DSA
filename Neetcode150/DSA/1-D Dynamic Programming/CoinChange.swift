//
//  CoinChange.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/02/25.
//

//https://leetcode.com/problems/coin-change/
//https://neetcode.io/problems/coin-change
class CoinChange {
    
    init() {
//        Input: coins = [1,2,5], amount = 11
//        Output: 3
//        Explanation: 11 = 5 + 5 + 1
        runTest()
    }
    
    func runTest() {
        let coins = [1,2,5], amount = 11
        let res = coinChange(coins, amount)
        print(res)
    }
    
    // Time Complexity: O(m*n) || Space Compelxity: O(n)
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        var prices = [Int](repeating: amount + 1, count: amount + 1)
        prices[0] = 0
        
        for i in 1...amount {
            for j in 0..<coins.count {
                if coins[j] <= i {
                    let res = prices[i - coins[j]]
                    prices[i] = min(res + 1, prices[i])
                }
            }
        }
        return prices[amount] > amount ? -1 : prices[amount]
    }
    
}
