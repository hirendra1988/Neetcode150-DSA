//
//  RedundantConnection.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 17/01/25.
//

//https://leetcode.com/problems/redundant-connection/
//https://neetcode.io/problems/redundant-connection
class RedundantConnection {
    
    var parent = [Int]()
    
    init() {
        //        Input: edges = [[1,2],[1,3],[2,3]]
        //        Output: [2,3]
        runTest()
    }
    
    func runTest() {
        let edges = [[1,2],[1,3],[2,3]]
        let res = findRedundantConnection(edges)
        print(res)
    }
    
    // Time Complexity: O(E*a(V)) where a(V) is constant || Space Compelxity: O(V) // Using Union find approach
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        parent = Array(0...n)
        var rank = [Int](repeating: 0, count: n + 1)
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let parentX = find(u)
            let parentY = find(v)
            
            if parentX == parentY {
                return edge
            }
            if parent[parentX] < parent[parentY] {
                parent[parentX] = parentY
            } else if parent[parentY] < parent[parentX] {
                parent[parentY] = parentX
            } else {
                parent[parentX] = parentY
                rank[parentY] += 1
            }
        }
        
        return []
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        }
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n) // Using chycle detection approach
    func findRedundantConnection1(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        var adjacencyList = [[Int]](repeating: [], count: n + 1)
        
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            
            // Check if adding this edge creates a cycle
            var visited = [Bool](repeating: false, count: n + 1)
            if !adjacencyList[u].isEmpty && !adjacencyList[v].isEmpty {
                if dfs(u, -1, v, adjacencyList, &visited) {
                    return edge // This edge is redundant
                }
            }
            
            addUEdge(u, v, &adjacencyList)
        }
        return []
    }
    
    func dfs(_ s: Int,
             _ parent: Int,
             _ target: Int,
             _ adjacencyList: [[Int]],
             _ visited: inout [Bool]) -> Bool {
        visited[s] = true
        for neighbor in adjacencyList[s] {
            if neighbor == target {
                return true // A cycle is found
            }
            if !visited[neighbor] {
                if dfs(neighbor, s, target, adjacencyList, &visited) {
                    return true
                }
            } else if neighbor != parent {
                return true
            }
        }
        return false
    }
    
    func addUEdge(_ u: Int, _ v: Int, _ adjacencyList: inout [[Int]]) {
        adjacencyList[u].append(v)
        adjacencyList[v].append(u)
    }
    
}
