//
//  DailyTemperatures.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 20/12/24.
//

//https://leetcode.com/problems/daily-temperatures/
//https://neetcode.io/problems/daily-temperatures
class DailyTemperatures {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let temperatures = [73,74,75,71,69,72,76,73]
        let res = dailyTemperatures(temperatures)
        print(res)
    }
    
    // Next greater element approach
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Int]()
        stack.append(temperatures.count - 1)
        var result = [Int](repeating: 0, count: temperatures.count)
        result[temperatures.count - 1] = 0
        for i in stride(from: temperatures.count - 2, through: 0, by: -1) {
            while !stack.isEmpty, temperatures[stack.last!] <= temperatures[i] {
                stack.popLast()
            }
            if let last = stack.last {
                result[i] = last - i
            } else  {
                result[i] = 0
            }
            stack.append(i)
        }
        return result
    }
}
