//
//  FruitsIntoBaskets.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 13/12/24.
//

//https://leetcode.com/problems/fruit-into-baskets/
//https://www.youtube.com/watch?v=Oi09pnLLy78&t=926s
class FruitsIntoBaskets {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let fruits = [1,2,3,2,2] //Output: 4
        let result = totalFruit(fruits)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func totalFruit(_ fruits: [Int]) -> Int {
        var hashMap = [Int: Int]()
        var left = 0
        var result = 0
        for right in 0..<fruits.count {
            hashMap[fruits[right], default: 0] += 1
            while hashMap.count > 2 {
                hashMap[fruits[left]]! -= 1
                if hashMap[fruits[left]] == 0 {
                    hashMap[fruits[left]] = nil
                }
                left += 1
            }
            result = max(result, right - left + 1)
        }
        return result
    }
    
}
