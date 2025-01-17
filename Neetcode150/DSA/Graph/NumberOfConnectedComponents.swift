//
//  NumberOfConnectedComponents.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 17/01/25.
//

//323. Number of Connected Components in an Undirected Graph
//https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/
//https://neetcode.io/problems/count-connected-components
class NumberOfConnectedComponents {
    
    init() {
//        Input: n = 5, edges = [[0,1],[1,2],[3,4]]
//        Output: 2
        runTest()
    }
    
    func runTest() {
        let n = 5, edges = [[0,1],[1,2],[3,4]]
        let res = countComponents(n, edges)
        print(res)
    }
    
    // Time Complexity: O(V+E) || Space Compelxity: O(V)
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var visited = [Bool](repeating: false, count: n)
        var adjacencyList = [[Int]](repeating: [], count: n)
        
        for edge in edges {
            addUAdge(edge[0], edge[1], &adjacencyList)
        }
        var count = 0
        for i in 0..<n {
            if !visited[i] {
                dfs(i, &visited, adjacencyList)
                count += 1
            }
        }
        
        return count
    }
    
    func dfs(_ s: Int, _ visited: inout [Bool], _ adjacencyList: [[Int]]) {
        visited[s] = true
        for neighbour in adjacencyList[s] {
            if !visited[neighbour] {
                dfs(neighbour, &visited, adjacencyList)
            }
        }
    }
    
    func addUAdge(_ u: Int, _ v: Int, _ adj: inout [[Int]]) {
        adj[u].append(v)
        adj[v].append(u)
    }
}
