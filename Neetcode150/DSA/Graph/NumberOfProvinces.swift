//
//  NumberOfProvinces.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 19/11/25.
//

//https://leetcode.com/problems/number-of-provinces/
//https://neetcode.io/problems/number-of-provinces/question?list=neetcode250
//https://www.youtube.com/watch?v=W3YyfjxKcA0
class NumberOfProvinces {
    
    init() {
        runTest()
    }
    
//    Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
//    Output: 2
    func runTest() {
        let isConnected = [[1,1,0],[1,1,0],[0,0,1]]
        print(findCircleNum(isConnected))
    }
    
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let n = isConnected.count
        var adj = [[Int]](repeating: [], count: n)
        for i in 0..<isConnected.count {
            for j in 0..<isConnected[i].count {
                if isConnected[i][j] == 1 {
                    adj[i].append(j)
                }
            }
        }
        
        var visited = [Bool](repeating: false, count: n)
        var count = 0
        
        for i in 0..<n {
            if !visited[i] {
                dfs(adj, &visited, i)
                count += 1
            }
        }
        
        return count
    }
    
    func dfs(_ adj: [[Int]], _ visited: inout [Bool], _ u: Int) {
        visited[u] = true
        for n in adj[u] {
            if !visited[n] {
                dfs(adj, &visited, n)
            }
        }
    }
    
}
