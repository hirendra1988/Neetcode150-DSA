//
//  NetworkDelayTime.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 19/01/25.
//

//https://leetcode.com/problems/network-delay-time/
//https://neetcode.io/problems/network-delay-time
class NetworkDelayTime {
    
    class Node {
        var vertex: Int
        var weight: Int
        init(_ vertex: Int, _ weight: Int) {
            self.vertex = vertex
            self.weight = weight
        }
    }
    
    init() {
//        Input: times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2
//        Output: 2
        runTest()
    }
    
    func runTest() {
        let times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2
        let result = networkDelayTime(times, n, k)
        print(result)
    }
    
    // Time Complexity: O(n^2) || Space Compelxity: O(n)
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var adj = [[Node]](repeating: [Node](), count: n + 1)
        
        for time in times {
            addDEdge(time[0], time[1], time[2], &adj)
        }
        
        var block = [Bool](repeating: false, count: n + 1)
        var d = [Int](repeating: Int.max, count: n + 1)
        d[k] = 0
        
        for _ in 0..<n {
            var u = -1
            for j in 1...n {
                if !block[j] && (u == -1 || d[j] < d[u]) {
                    u = j
                }
            }
            if u == -1 {
                break
            }
            block[u] = true

            for node in adj[u] {
                if !block[node.vertex] && d[u] != Int.max &&
                d[node.vertex] > (d[u] + node.weight) {
                    d[node.vertex] = d[u] + node.weight
                }
            }
        }
        let maxDelay = d[1...n].max()!
        return maxDelay == Int.max ? -1 : maxDelay
    }

    func addDEdge(_ u: Int, _ v: Int, _ weight: Int, _ adj: inout [[Node]]) {
        adj[u].append(Node(v, weight))
    }
    
//    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
//
//        var adj = [[Node]](repeating: [Node](), count: n + 1)
//        var block = [Bool](repeating: false, count: n + 1)
//        var d = [Int](repeating: Int.max, count: n + 1)
//        
//        d[k] = 0 // Start from node k
//
//        for time in times {
//            addDEdge(time[0], time[1], time[2], &adj)
//        }
//        
//        for _ in 0..<n {
//            var u = -1
//            for j in 1...n { // Nodes are 1-indexed
//                if !block[j] && (u == -1 || d[j] < d[u]) {
//                    u = j
//                }
//            }
//            
//            if u == -1 { // No reachable node left
//                break
//            }
//            
//            block[u] = true
//            
//            for node in adj[u] {
//                if !block[node.vertex] && d[u] != Int.max && (d[node.vertex] > (d[u] + node.weight)) {
//                    d[node.vertex] = d[u] + node.weight
//                }
//            }
//        }
//        let maxDelay = d[1...n].max()!
//        return maxDelay == Int.max ? -1 : maxDelay
//    }
//    
//    func addDEdge(_ u: Int, _ v: Int, _ weight: Int, _ adj: inout [[Node]]) {
//        adj[u].append(Node(v, weight))
//    }
    
    func display() {
        
    }
    
}
