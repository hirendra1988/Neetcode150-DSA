//
//  CheapestFlights.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/03/25.
//

//https://leetcode.com/problems/cheapest-flights-within-k-stops/
//https://neetcode.io/problems/cheapest-flight-path
//https://www.youtube.com/watch?v=NIrYezLg_6Q/
class CheapestFlights {
    
    init() {
//        Input: n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1
//        Output: 700
//        Explanation:
//        The graph is shown above.
//        The optimal path with at most 1 stop from city 0 to 3 is marked in red and has cost 100 + 600 = 700.
//        Note that the path through cities [0,1,2,3] is cheaper but is invalid because it uses 2 stops.
        runTest()
    }
    
    func runTest() {
        let n = 4
        let flights = [
            [0,1,100],
            [1,2,100],
            [2,0,100],
            [1,3,600],
            [2,3,200]]
        let src = 0, dst = 3, k = 1
        let res = findCheapestPrice(n, flights, src, dst, k)
        print(res)
    }
    
    // Using Bellman-Ford Algo
    // Time Complexity: O(k*flights) || Space Compelxity: O(n)
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var d = [Int](repeating: Int.max, count: n)
        d[src] = 0
        for _ in 0...k {
            var temp = d
            for flight in flights {
                let source = flight[0]
                let dest = flight[1]
                let price = flight[2]
                
                if d[source] != Int.max && ((d[source] + price) < temp[dest]) {
                    temp[dest] = d[source] + price
                }
            }
            d = temp
        }
        return d[dst] == Int.max ? -1 : d[dst]
    }
    
}
