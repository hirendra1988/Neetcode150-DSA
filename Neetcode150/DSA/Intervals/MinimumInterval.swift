//
//  MinimumInterval.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/02/25.
//

//https://leetcode.com/problems/minimum-interval-to-include-each-query/
//https://neetcode.io/problems/minimum-interval-including-query
class MinimumInterval {
    
    init() {
//        Input: intervals = [[1,4],[2,4],[3,6],[4,4]], queries = [2,3,4,5]
//        Output: [3,3,1,4]
//        Explanation: The queries are processed as follows:
//        - Query = 2: The interval [2,4] is the smallest interval containing 2. The answer is 4 - 2 + 1 = 3.
//        - Query = 3: The interval [2,4] is the smallest interval containing 3. The answer is 4 - 2 + 1 = 3.
//        - Query = 4: The interval [4,4] is the smallest interval containing 4. The answer is 4 - 4 + 1 = 1.
//        - Query = 5: The interval [3,6] is the smallest interval containing 5. The answer is 6 - 3 + 1 = 4.
        runTest()
    }
    
    func runTest() {
        //let intervals = [[1,4],[2,4],[3,6],[4,4]], queries = [2,3,4,5]
        let intervals = [[2,3],[2,5],[1,8],[20,25]], queries = [2,19,5,22]
        let res = minInterval(intervals, queries)
        print(res)
    }
    
    //Time Complexity: O(n^2) || Space Compelxity: O(n)
    func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        if intervals.isEmpty {
            return []
        }
        var minDiff = Int.max
        var res = [Int]()
        for query in queries {
            minDiff = Int.max
            for i in 0..<intervals.count {
                let currStart = intervals[i][0]
                let currEnd = intervals[i][1]
                if query >= currStart && query <= currEnd {
                    if (currEnd - currStart + 1) < minDiff {
                        minDiff = currEnd - currStart + 1
                    }
                }
            }
            if minDiff != Int.max {
                res.append(minDiff)
            } else {
                res.append(-1)
            }
        }
        return res
    }
    
}
