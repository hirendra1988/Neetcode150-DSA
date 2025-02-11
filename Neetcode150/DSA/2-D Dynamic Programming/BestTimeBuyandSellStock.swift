//
//  BestTimeBuyandSellStock.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/02/25.
//

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
//https://neetcode.io/problems/buy-and-sell-crypto-with-cooldown/
class BestTimeBuyandSellStock {
    
    init() {
        //        Input: prices = [1,2,3,0,2]
        //        Output: 3
        //        Explanation: transactions = [buy, sell, cooldown, buy, sell]
        runTest()
    }
    
    func runTest() {
        let prices = [1,2,3,0,2]
        let res = maxProfit(prices)
        print(res)
    }
    
    // Using Memoization
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = [String: Int]()
        return maxProfitHelper(prices, 0, true, &dp)
    }
    
    func maxProfitHelper(_ prices: [Int], _ i: Int, _ buying: Bool, _ dp: inout [String: Int]) -> Int {
        if i >= prices.count {
            return 0
        }
        
        if let cacheResult = dp["\(buying)\(i)"] {
            return cacheResult
        }
        
        if buying {
            let buy = maxProfitHelper(prices, i+1, false, &dp) - prices[i]
            let noBuy = maxProfitHelper(prices, i+1, true, &dp)
            dp["\(buying)\(i)"] = max(buy, noBuy)
        } else {
            let sell = maxProfitHelper(prices, i+2, true, &dp) + prices[i]
            let noSell = maxProfitHelper(prices, i+1, false, &dp)
            dp["\(buying)\(i)"] = max(sell, noSell)
        }
        return dp["\(buying)\(i)"]!
    }
    
    // Using Recursion
    func maxProfit1(_ prices: [Int]) -> Int {
        return maxProfitHelper1(prices, 0, true)
    }
    
    func maxProfitHelper1(_ prices: [Int], _ i: Int, _ buying: Bool) -> Int {
        if i >= prices.count {
            return 0
        }
        var profit = 0
        if buying {
            let buy = maxProfitHelper1(prices, i+1, false) - prices[i]
            let noBuy = maxProfitHelper1(prices, i+1, true)
            profit = max(buy, noBuy)
        } else {
            let sell = maxProfitHelper1(prices, i+2, true) + prices[i]
            let noSell = maxProfitHelper1(prices, i+1, false)
            profit = max(sell, noSell)
        }
        return profit
    }
    
}
