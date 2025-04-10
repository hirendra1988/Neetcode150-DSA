//
//  AlienDictionary.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/03/25.
//

//https://leetcode.com/problems/alien-dictionary/
//https://neetcode.io/problems/foreign-dictionary
//https://www.youtube.com/watch?v=6kTZYvNNyps
class AlienDictionary {
    var graph = [Character: [Character]]()
    init() {
        //        Example 1:
        //        Input: words = ["wrt","wrf","er","ett","rftt"]
        //        Output: "wertf"
        //
        //        Example 2:
        //        Input: words = ["z","x"]
        //        Output: "zx"
        //
        //        Example 3:
        //        Input: words = ["z","x","z"]
        //        Output: ""
        //        Explanation: The order is invalid, so return "".
        runTest()
    }
    
    func runTest() {
        let words = ["wrt","wrf","er","ett","rftt"]
        let res = alienOrder(words)
        print(res)
    }
    
    // Using Dijkstra Algo
    // Time Complexity: O(N + E) || Space Compelxity: O(N + E)
    func alienOrder(_ words: [String]) -> String {
        let n = words.count
        var inDegree = [Character: Int]()
        
        // Step 1: Initialize Graph and Unique Characters
        for word in words {
            for char in word {
                if graph[char] == nil {
                    graph[char] = []
                    inDegree[char] = 0
                }
            }
        }
        
        // Step 2: Build Graph
        for i in 0..<n-1 {
            let word1 = Array(words[i])
            let word2 = Array(words[i+1])
            let minLen = min(word1.count, word2.count)
            if word1.count > word2.count && (word1.prefix(minLen) == word2.prefix(minLen)) {
                return ""
            }
            for j in 0..<minLen {
                let u = word1[j]
                let v = word2[j]
                if u != v {
                    if !(graph[u]!.contains(v)) {
                        addDEdge(u: u, v: v)
                        inDegree[word2[j], default: 0] += 1
                    }
                    break
                }
            }
        }
        
        // Step 3: Topological Sort using BFS
        var queue = [Character]()
        for (char, degree) in inDegree {
            if degree == 0 {
                queue.append(char)
            }
        }
        
        var result = [Character]()
        while !queue.isEmpty {
            let char = queue.removeFirst()
            result.append(char)
            
            for neighbour in graph[char] ?? [] {
                inDegree[neighbour, default: 0] -= 1
                if inDegree[neighbour] == 0 {
                    queue.append(neighbour)
                }
            }
        }
        return result.count == inDegree.count ? String(result) : ""
    }
    
    func addDEdge(u: Character, v: Character) {
        graph[u]!.append(v)
    }
}
