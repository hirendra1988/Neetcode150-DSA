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
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Int]()
        var answer = [Int](repeating: 0, count: temperatures.count)
        
        for i in 0..<temperatures.count {
            while let last = stack.last, temperatures[last] < temperatures[i] {
                stack.popLast()
                answer[last] = i - last
            }
            stack.append(i)
        }
        return answer
    }
}
