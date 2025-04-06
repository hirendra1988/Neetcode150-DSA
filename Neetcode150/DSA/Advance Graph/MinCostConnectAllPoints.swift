//
//  MinCostConnectAllPoints.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 20/01/25.
//

//https://leetcode.com/problems/min-cost-to-connect-all-points/
//https://neetcode.io/problems/min-cost-to-connect-points
class MinCostConnectAllPoints {
    
    class Node {
        var vertex: Int
        var weight: Int
        init(_ vertex: Int, _ weight: Int) {
            self.vertex = vertex
            self.weight = weight
        }
    }
    
    init() {
        //        Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
        //        Output: 20
        runTest()
    }
    
    func runTest() {
        let points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
        let res = minCostConnectPoints(points)
        print(res)
    }
    
    // Optimal Approcah
    // Time Complexity: O(n^2 logn) || Space Compelxity: O(n^2)
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        
        var adj = [[Node]](repeating: [], count: n)
        for i in 0..<points.count {
            let x1 = points[i][0]
            let y1 = points[i][1]
            for j in i+1..<points.count {
                let x2 = points[j][0]
                let y2 = points[j][1]
                let weight = abs(x1-x2) + abs(y1-y2)
                addUEdge(i, j, weight, &adj)
            }
        }
        
        var mst = [Bool](repeating: false, count: n)
        var keys = [Int](repeating: Int.max, count: n)
        keys[0] = 0
        var result = 0
        for _ in 0..<n {
            var vertex = -1
            for j in 0..<n {
                if !mst[j] && (vertex == -1 || keys[j] < keys[vertex]) {
                    vertex = j
                }
            }
            mst[vertex] = true
            result += keys[vertex]
            
            for node in adj[vertex] {
                if !mst[node.vertex] && node.weight < keys[node.vertex] {
                    keys[node.vertex] = node.weight
                }
            }
        }
        return result
    }
    
    // Graph Construction Time Complexity: O(n^2)
    // MST Construction Time Complexity: O(n^3)
    // Space Compelxity: O(n^2)
    func minCostConnectPoints1(_ points: [[Int]]) -> Int {
        let n = points.count
        var adj = [[Node]](repeating: [], count: n)
        for i in 0..<points.count {
            let x1 = points[i][0]
            let y1 = points[i][1]
            for j in i+1..<points.count {
                let x2 = points[j][0]
                let y2 = points[j][1]
                let weight = abs(x1-x2) + abs(y1-y2)
                addUEdge(i, j, weight, &adj)
            }
        }
        
        var mst = Set<Int>()
        mst.insert(0)
        
        var nonmst = Set<Int>()
        for i in 1..<n {
            nonmst.insert(i)
        }
        
        var result = 0
        while !nonmst.isEmpty {
            var vertex = -1
            var min = Int.max
            
            for i in mst {
                for node in adj[i] {
                    if !mst.contains(node.vertex) && (vertex == -1 || node.weight < min) {
                        vertex = node.vertex
                        min = node.weight
                    }
                }
            }
            
            if min == Int.max {
                break
            }
            
            result += min
            mst.insert(vertex)
            nonmst.remove(vertex)
        }
        
        return result
    }
    
    func addUEdge(_ u: Int, _ v: Int, _ weight: Int, _ adj: inout [[Node]]) {
        adj[u].append(Node(v, weight))
        adj[v].append(Node(u, weight))
    }
    
    private func display(_ vertexCount: Int, _ adjacencyList: [[Node]]) {
        for i in 0..<vertexCount {
            print("\(i) | ", terminator: " ")
            for node in adjacencyList[i] {
                print("\(node.vertex)(\(node.weight))", terminator: " -> ")
            }
            print("")
        }
        print("\n")
    }
    
}
