//
//  GraphDSA.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 15/07/25.
//

class GraphDSA {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let accounts = [
            ["John","johnsmith@mail.com","john_newyork@mail.com"],
            ["John","johnsmith@mail.com","john00@mail.com"],
            ["Mary","mary@mail.com"],
            ["John","johnnybravo@mail.com"]
        ]
        let res = accountsMerge(accounts)
        print(res)
    }
    
    // js    jn
    
    // j00
    
    //https://leetcode.com/problems/accounts-merge/description/?envType=company&envId=grab&favoriteSlug=grab-thirty-days
    //721. Accounts Merge
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var result = [[String]]()
        var graph = [String: [String]]()
        var emailToName = [String: String]()
        var visited = Set<String>()
        for account in accounts {
            let name = account[0]
            let firstEmail = account[1]
            for i in 1..<account.count {
                let email = account[i]
                addUEdge(firstEmail, email, &graph)
                emailToName[email] = name
            }
        }
        
        for email in graph.keys {
            if !visited.contains(email) {
                var components = [String]()
                dfs(&components, email, &visited, graph)
                components.sort()
                if let name = emailToName[email] {
                    result.append([name] + components)
                }
            }
        }
        
        return result
    }
    
    func dfs(_ components: inout [String],
             _ email: String,
             _ visited: inout Set<String>,
             _ graph: [String: [String]]) {
        visited.insert(email)
        components.append(email)
        for neighbour in graph[email] ?? [] {
            if !visited.contains(neighbour) {
                dfs(&components, neighbour, &visited, graph)
            }
        }
    }
    
    func addUEdge(_ u: String, _ v: String, _ graph: inout [String: [String]]) {
        graph[u, default: []].append(v)
        graph[v, default: []].append(u)
    }
}
