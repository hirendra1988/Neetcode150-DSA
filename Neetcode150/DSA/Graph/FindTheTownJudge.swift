//
//  FindTheTownJudge.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 15/11/25.
//

//https://leetcode.com/problems/find-the-town-judge/
//https://neetcode.io/problems/find-the-town-judge?list=neetcode250
//https://www.youtube.com/watch?v=mVaViamZYWo
class FindTheTownJudge {
    
    init() {
        runTest()
    }
    
//    Input: n = 3, trust = [[1,3],[2,3]]
//    Output: 3
    func runTest() {
        let n = 3, trust = [[1,3],[2,3]]
        print(findJudge(n, trust))
    }
    
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var inDegree = [Int](repeating: 0, count: n + 1)
        var outDegree = [Int](repeating: 0, count: n + 1)
        
        for pair in trust {
            inDegree[pair[1]] += 1
            outDegree[pair[0]] += 1
        }
        
        for i in 1...n {
            if outDegree[i] == 0 && inDegree[i] == n - 1 {
                return i
            }
        }
        return -1
    }
    
}
