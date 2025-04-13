//
//  CoinChangeII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/02/25.
//

//https://leetcode.com/problems/coin-change-ii/
//https://neetcode.io/problems/coin-change-ii
class CoinChangeII {
    
    init() {
        //        Input: amount = 5, coins = [1,2,5]
        //        Output: 4
        //        Explanation: there are four ways to make up the amount:
        //        5=5
        //        5=2+2+1
        //        5=2+1+1+1
        //        5=1+1+1+1+1
        runTest()
    }
    
    func runTest() {
        let amount = 5, coins = [1,2,5]
        let res = change(amount, coins)
        print(res)
    }
    
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount % 2 != 0 && coins.allSatisfy({ $0 % 2 == 0 }) {
            return 0
        }
        var prices = [Int](repeating: 0, count: amount + 1)
        for coin in coins {
            if coin > amount {
                continue
            }
            for i in coin...amount {
                if i >= coin {
                    prices[i] += prices[i-coin]
                }
            }
        }
        return prices[amount]
    }
    
}
