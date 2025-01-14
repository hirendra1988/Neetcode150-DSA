//
//  CloneGraph.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 14/01/25.
//

//https://leetcode.com/problems/clone-graph/
//https://neetcode.io/problems/clone-graph
class CloneGraph {
    
    var map = [Int: Node]()
    
    public class Node {
        public var val: Int
        public var neighbors: [Node?]
        public init(_ val: Int) {
            self.val = val
            self.neighbors = []
        }
    }
    
    init() {
        //        Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
        //        Output: [[2,4],[1,3],[2,4],[1,3]]
        //        Explanation: There are 4 nodes in the graph.
        //        1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
        //        2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
        //        3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
        //        4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
        runTest()
    }
    
    func runTest() {
        let adjList = [[2,4],[1,3],[2,4],[1,3]]
        let node = createGraph(from: adjList)
        let res = cloneGraph(node)
        print(res!.val)
    }
    
    func cloneGraph(_ node: Node?) -> Node? {
        return bfs(node)
    }
    
    // Time Complexity: O(V + E) || Space Compelxity: O(V)
    func bfs(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        var queue = [Node]()
        var hashMap = [Int: Node]()
        queue.append(node)
        hashMap[node.val] = Node(node.val)
        
        while !queue.isEmpty {
            var firstNode = queue.removeFirst()
            for neighbor in firstNode.neighbors {
                if hashMap[neighbor!.val] == nil {
                    hashMap[neighbor!.val] = Node(neighbor!.val)
                    queue.append(neighbor!)
                }
                hashMap[firstNode.val]?.neighbors.append(hashMap[neighbor!.val])
            }
        }
        return hashMap[node.val]
    }
    
    func dfs(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        if let clonedNode = map[node.val] {
            return clonedNode
        }
        map[node.val] = Node(node.val)
        
        for neighbor in node.neighbors {
            map[node.val]?.neighbors.append(dfs(neighbor))
        }
        return map[node.val]
    }
    
    func createGraph(from adjList: [[Int]]) -> Node? {
        // Edge case: empty adjacency list
        if adjList.isEmpty { return nil }

        // Step 1: Create nodes for each index
        var nodes = [Node?](repeating: nil, count: adjList.count + 1)
        for i in 1...adjList.count {
            nodes[i] = Node(i)
        }

        // Step 2: Connect neighbors
        for (i, neighbors) in adjList.enumerated() {
            let node = nodes[i + 1] // Current node (index + 1)
            for neighborVal in neighbors {
                node?.neighbors.append(nodes[neighborVal]) // Add neighbor nodes
            }
        }

        // Return the first node as the entry point to the graph
        return nodes[1]
    }
    
}
