//
//  CourseSchedule_IV.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 18/11/25.
//

//https://leetcode.com/problems/course-schedule-iv/
//https://www.youtube.com/watch?v=v08_3bBHaMg

class CourseSchedule_IV {
    
    init() {
        //        Input: numCourses = 2, prerequisites = [[1,0]]
        //        Output: [0,1]
        runTest()
    }
    
    func runTest() {
        let numCourses = 2, prerequisites = [[1,0]], queries = [[0,1],[1,0]]
        let res = checkIfPrerequisite(numCourses, prerequisites, queries)
        print(res)
    }
    
    func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var adj = [[Int]](repeating: [], count: numCourses)
        var inDegree = [Int](repeating: 0, count: numCourses)
        
        for prerequisite in prerequisites {
            let a1 = prerequisite[0]
            let b1 = prerequisite[1]
            adj[a1].append(b1)
            inDegree[b1] += 1
        }
        
        // OR
        // for list in adj {
        //     for val in list {
        //         inDegree[val] += 1
        //     }
        // }
        
        var queue = [Int]()
        for i in 0..<numCourses {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        
        var reachable = [[Bool]](repeating: [Bool](repeating: false, count: numCourses), count: numCourses)
        
        while !queue.isEmpty {
            var current = queue.removeFirst()
            for n in adj[current] {
                
                reachable[current][n] = true
                
                for i in 0..<numCourses {
                    if reachable[i][current] {
                        reachable[i][n] = true
                    }
                }
                
                inDegree[n] -= 1
                if inDegree[n] == 0 {
                    queue.append(n)
                }
            }
        }
        var result = [Bool]()
        for query in queries {
            let q1 = query[0]
            let q2 = query[1]
            result.append(reachable[q1][q2])
        }
        return result
    }
}
