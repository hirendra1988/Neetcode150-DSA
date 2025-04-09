//
//  ReconstructItinerary.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 21/01/25.
//

//https://leetcode.com/problems/reconstruct-itinerary/
//https://neetcode.io/problems/reconstruct-flight-path
class ReconstructItinerary {
    
    init() {
        //        Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
        //        Output: ["JFK","MUC","LHR","SFO","SJC"]
        
        //        Input: tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
        //        Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
        //        Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"] but it is larger in lexical order.
        runTest()
    }
    
    func runTest() {
        let tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
        //[["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
        let result = findItinerary(tickets)
        print(result)
    }
    
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func findItinerary(_ tickets: [[String]]) -> [String] {
        if tickets.isEmpty {
            return []
        }
        
        let sortedTickets = tickets.sorted {
            return $0[1] < $1[1]
        }
        
        var adj = [String: [String]]()
        for ticket in sortedTickets {
            let from = ticket[0]
            let to = ticket[1]
            adj[from, default: []].append(to)
        }
        
        var result = [String]()
        dfs(&result, "JFK", &adj)
        return result.reversed()
    }
    
    func dfs(_ result: inout [String], _ ticket: String, _ adj: inout [String: [String]]) {
        if adj[ticket] != nil {
            while !adj[ticket]!.isEmpty {
                dfs(&result, adj[ticket]!.removeFirst(), &adj)
            }
        }
        result.append(ticket)
    }
    
}
