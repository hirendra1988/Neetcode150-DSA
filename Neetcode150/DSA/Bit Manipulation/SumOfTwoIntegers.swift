//
//  SumOfTwoIntegers.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 28/02/25.
//

//https://leetcode.com/problems/sum-of-two-integers/
//https://neetcode.io/problems/sum-of-two-integers
//https://www.youtube.com/watch?v=gVUrDV4tZfY
class SumOfTwoIntegers {
    
    init() {
//        Input: a = 1, b = 2
//        Output: 3
        runTest()
    }
    
    func runTest() {
        let a = 1, b = 2
        let res = getSum(a, b)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    //Where n is the number of bits in the integers (typically 32 for Int in Swift).
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let carry = (a & b) << 1
            a = a ^ b
            b = carry
        }
        return a
    }
    
}
