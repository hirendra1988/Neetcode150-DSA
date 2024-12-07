//
//  BuyAndSellStock.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 07/12/24.
//

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
//https://neetcode.io/problems/buy-and-sell-crypto
class BuyAndSellStock {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let prices = [7,1,5,3,6,4]
        //Output: 5
        let result = maxProfit(prices)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minVal = prices[0]
        for i in 1..<prices.count {
            minVal = min(minVal, prices[i])
            maxProfit = max(maxProfit, prices[i] - minVal)
        }
        return maxProfit
    }
    
}
