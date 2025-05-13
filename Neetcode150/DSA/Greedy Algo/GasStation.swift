//
//  GasStation.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 17/02/25.
//

//https://leetcode.com/problems/gas-station/
//https://neetcode.io/problems/gas-station
//https://www.youtube.com/watch?v=fOaUh1_fJPw
class GasStation {
    
    init() {
//        Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
//        Output: 3
//        Explanation:
//        Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
//        Travel to station 4. Your tank = 4 - 1 + 5 = 8
//        Travel to station 0. Your tank = 8 - 2 + 1 = 7
//        Travel to station 1. Your tank = 7 - 3 + 2 = 6
//        Travel to station 2. Your tank = 6 - 4 + 3 = 5
//        Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
//        Therefore, return 3 as the starting index.
        runTest()
    }
    
    func runTest() {
        let gas = [1,2,3,4,5], cost = [3,4,5,1,2]
        let result = canCompleteCircuit(gas, cost)
        print(result)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalGas = 0
        var toalCost = 0
        for i in 0..<gas.count {
            totalGas += gas[i]
            toalCost += cost[i]
        }
        
        if totalGas < toalCost {
            return -1
        }
        
        var currGas = 0
        var currIndex = 0
        for i in 0..<gas.count {
            currGas += gas[i] - cost[i]
            if currGas < 0 {
                currGas = 0
                currIndex = i + 1
            }
        }
        return currIndex
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func canCompleteCircuit2(_ gas: [Int], _ cost: [Int]) -> Int {
        var index = 0
        var totalDiff = 0
        var fuel = 0
        for i in 0..<gas.count {
            let diff = gas[i] - cost[i]
            totalDiff += diff
            fuel += diff
            if fuel < 0 {
                index = i + 1
                fuel = 0
            }
        }
        return totalDiff < 0 ? -1 : index
    }
    
}
