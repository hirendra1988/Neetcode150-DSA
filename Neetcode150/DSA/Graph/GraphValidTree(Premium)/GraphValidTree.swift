//
//  GraphValidTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/01/25.
//

//https://leetcode.com/problems/graph-valid-tree/description/
//https://neetcode.io/problems/valid-tree
class GraphValidTree {
    var parent = [Int]()
    init() {
        //        Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
        //        Output: true
        runTest()
    }
    
    func runTest() {
        let n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
        let res = validTree(n, edges)
        print(res)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n) // Using Union Find Approach
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.count != n - 1 {
            return false
        }
        parent = Array(0..<n)
        var rank = [Int](repeating: 0, count: n)
        
        for edge in edges {
            let u = edge[0]
            let v = edge[1]
            let x = find(u)
            let y = find(v)
            if x == y {
                return false
            }
            if parent[x] < parent[y] {
                parent[x] = y
            } else if parent[x] > parent[y] {
                parent[y] = x
            } else {
                parent[y] = x
                rank[x] += 1
            }
        }
        return true
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] == x {
            return x
        }
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func validTree1(_ n: Int, _ edges: [[Int]]) -> Bool {
        // A tree with `n` nodes must have exactly `n - 1` edges
        if edges.count != n - 1 {
            return false
        }
        
        // Create adjacency list for the graph
        var graph = [[Int]](repeating: [], count: n)
        for edge in edges {
            addUndirectedEdge(edge[0], edge[1], &graph)
        }
        
        // Track visited nodes
        var visited = [Bool](repeating: false, count: n)
        
        // Check for cycles and connectivity
        if hasCycle(0, -1, graph, &visited) {
            return false
        }
        
        // Ensure all nodes are connected
        return visited.allSatisfy { $0 }
        
        // OR
        //        for nodeVisited in visited {
        //            if !nodeVisited {
        //                return false
        //            }
        //        }
        //        return true
    }
    
    private func hasCycle(_ node: Int, _ parent: Int, _ graph: [[Int]], _ visited: inout [Bool]) -> Bool {
        visited[node] = true
        for neighbor in graph[node] {
            if !visited[neighbor] {
                if hasCycle(neighbor, node, graph, &visited) {
                    return true
                }
            } else if neighbor != parent {
                return true
            }
        }
        return false
    }
    
    private func addUndirectedEdge(_ u: Int, _ v: Int, _ graph: inout [[Int]]) {
        graph[u].append(v)
        graph[v].append(u)
    }
    
    
}
