//
//  CourseSchedule_II.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 16/01/25.
//

//https://leetcode.com/problems/course-schedule-ii/
//https://neetcode.io/problems/course-schedule-ii
class CourseSchedule_II {
    
    init() {
        //        Input: numCourses = 2, prerequisites = [[1,0]]
        //        Output: [0,1]
        runTest()
    }
    
    func runTest() {
        let numCourses = 2, prerequisites = [[1,0]]
        let res = findOrder(numCourses, prerequisites)
        print(res)
    }
    
    // Time Complexity: O(V+E) || Space Compelxity: O(V+E)
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var inDegrees = [Int](repeating: 0, count: numCourses)
        
        var adjacencyList = [[Int]](repeating: [], count: numCourses)
        for list in prerequisites {
            addDEdge(list[1], list[0], &adjacencyList)
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
        return array.count == numCourses ? array : []
    }
    
    func addDEdge(_ u: Int, _ v: Int, _ adj: inout [[Int]]) {
        adj[u].append(v)
    }
    
}
