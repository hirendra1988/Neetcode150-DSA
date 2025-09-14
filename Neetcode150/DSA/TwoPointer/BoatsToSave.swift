//
//  Untitled.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 14/09/25.
//

//https://leetcode.com/problems/boats-to-save-people/description/
//https://neetcode.io/problems/boats-to-save-people?list=neetcode250
class BoatsToSave {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let people = [3,2,2,1], limit = 3
        //let people = [3,5,3,4], limit = 5
        let res = numRescueBoats(people, limit)
        print(res)
    }
    
    // Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var result = 0
        let people = people.sorted()
        var left = 0
        var right = people.count - 1
        while left <= right {
            if people[left] + people[right] <= limit {
                left += 1
            }
            right -= 1
            result += 1
        }
        return result
    }
    
}
