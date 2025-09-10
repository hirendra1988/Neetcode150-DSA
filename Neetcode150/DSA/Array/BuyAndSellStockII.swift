//
//  BuyAndSellStockII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 10/09/25.
//

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/
//https://neetcode.io/problems/best-time-to-buy-and-sell-stock-ii?list=neetcode250
class BuyAndSellStockII {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let prices = [7,1,5,3,6,4]
        print(maxProfit(prices))
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                profit += prices[i] - prices[i-1]
            }
        }
        return profit
    }
    
}
