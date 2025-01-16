//
//  GraphValidTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/01/25.
//

//https://leetcode.com/problems/graph-valid-tree/description/
//https://neetcode.io/problems/valid-tree
class GraphValidTree {
    
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
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
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
