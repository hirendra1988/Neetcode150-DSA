//
//  AccountsMerge.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 18/11/25.
//

//https://leetcode.com/problems/accounts-merge/description/
//https://neetcode.io/problems/accounts-merge?list=neetcode250
//https://www.youtube.com/watch?v=kmzlMoxmCs4&t=1325s
class AccountsMerge {
    
    init() {
        runTest()
    }
    
    //    Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
    //    Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
    func runTest() {
        let accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
        print(accountsMerge(accounts))
    }
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var hashMap = [String: [String]]()
        var emailToName = [String: String]()
        var visited = Set<String>()
        
        for account in accounts {
            let name = account[0]
            let firstEmail = account[1]
            for i in 1..<account.count {
                let email = account[i]
                addUEdge(firstEmail, email, &hashMap)
                emailToName[email] = name
            }
        }
        
        var result = [[String]]()
        
        for email in hashMap.keys {
            if !visited.contains(email) {
                var components = [String]()
                dfs(&components, email, &hashMap, &visited)
                if let name = emailToName[email] {
                    result.append([name] + components.sorted())
                }
            }
        }
        return result
        
    }
    
    func dfs(_ components: inout [String],
             _ email: String,
             _ hashMap: inout [String: [String]],
             _ visited: inout Set<String>) {
        visited.insert(email)
        components.append(email)
        for n in hashMap[email, default: []] {
            if !visited.contains(n) {
                dfs(&components, n, &hashMap, &visited)
            }
        }
    }
    
    func addUEdge(_ u: String, _ v: String, _ hashMap: inout [String: [String]]) {
        hashMap[u, default: []].append(v)
        hashMap[v, default: []].append(u)
    }
    
}
