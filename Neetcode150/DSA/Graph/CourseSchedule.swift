//
//  CourseSchedule.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/01/25.
//

//https://leetcode.com/problems/course-schedule/
//https://neetcode.io/problems/course-schedule
class CourseSchedule {
    
    init() {
//        Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
//        Output: false
        runTest()
    }
    
    func runTest() {
        let numCourses = 2, prerequisites = [[1,0],[0,1]]
        let res = canFinish(numCourses, prerequisites)
        print(res)
    }
    
    // Time Complexity: O(V+E) || Space Compelxity: O(V+E)
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var inDegrees = [Int](repeating: 0, count: numCourses)
        
        var adjacencyList = [[Int]](repeating: [], count: numCourses)
        for list in prerequisites {
            addDEdge(list[0], list[1], &adjacencyList)
        }
        
        for list in adjacencyList {
            for val in list {
                inDegrees[val] += 1
            }
        }
        
        var queue = [Int]()
        for i in 0..<numCourses {
            if inDegrees[i] == 0 {
                queue.append(i)
            }
        }
        
        var array = [Int]()
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            array.append(current)
            
            for neighbour in adjacencyList[current] {
                inDegrees[neighbour] -= 1
                if inDegrees[neighbour] == 0 {
                    queue.append(neighbour)
                }
            }
            
        }
        return array.count == numCourses
    }
    
    func addDEdge(_ u: Int, _ v: Int, _ adj: inout [[Int]]) {
        adj[u].append(v)
    }
    
}
