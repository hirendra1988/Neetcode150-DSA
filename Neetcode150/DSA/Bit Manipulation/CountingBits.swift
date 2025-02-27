//
//  Counting ]Bits.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 27/02/25.
//

//https://leetcode.com/problems/counting-bits/
//https://neetcode.io/problems/counting-bits
class CountingBits {
    
    init() {
//        Input: n = 2
//        Output: [0,1,1]
//        Explanation:
//        0 --> 0
//        1 --> 1
//        2 --> 10
        runTest()
    }
    
    func runTest() {
        let n = 2
        let res = countBits(n)
        print(res)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func countBits(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        var res = [Int](repeating: 0, count: n+1)
        for i in 1...n {
            res[i] = res[i/2] + (i%2)
            // OR
            //res[i] = res[i >> 1] + (i%2)
            // OR
            //res[i] = res[i >> 1] + (i & 1)
        }
        return res
    }
    
    //Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func countBits1(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        var res = [Int](repeating: 0, count: n+1)
        for i in 1...n {
            var num = i
            var count = 0
            while num > 0 {
                num = num & (num-1)
                count += 1
            }
            if count != 0 {
                res[i] = count
            }
        }
        return res
    }
    
}
