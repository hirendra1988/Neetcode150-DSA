//
//  Numberof1Bits.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 27/02/25.
//

//https://leetcode.com/problems/number-of-1-bits/
//https://neetcode.io/problems/number-of-one-bits
//https://www.youtube.com/watch?v=5Km3utixwZs/
class Numberof1Bits {
    var count = 0
    init() {
//        Input: n = 11
//        Output: 3
//        Explanation:
//        The input binary string 1011 has a total of three set bits.
        runTest()
    }
    
    func runTest() {
        let n = 11
        let res = hammingWeight(n)
        print(res)
        print(count)
    }
    
    //Time Complexity: O(k) || Space Compelxity: O(1)
//    The loop runs exactly k times, where k is the number of set bits (1s) in the binary representation.
//    Worst case: All bits are 1 → O(k)
//    For a 32-bit integer, maximum k = 32
    // Using (Brian Kernighan)
    func hammingWeight(_ n: Int) -> Int {
//        🎯 How This Works 🔥
//        num = num & (num - 1)
//        ✅ This trick removes the lowest set bit (1) in each iteration.
//        Input: n = 13 (1101)
//        Step 1: 1101 & (1100) = 1100 (1 bit removed)
//        Step 2: 1100 & (1011) = 1000 (1 bit removed)
//        Step 3: 1000 & (0111) = 0000 (1 bit removed)
//        Result = 3
        
        var res = 0
        var num = n
        while num > 0 {
            num = num & (num-1)
            res += 1
        }
        return res
    }
    
    //Time Complexity: O(logn) || Space Compelxity: O(1)
    // Using Right Shift by 1
    func hammingWeight1(_ n: Int) -> Int {
        var res = 0
        var num = n
        while num > 0 {
            res += num % 2
            num = num >> 1
            count += 1
        }
        return res
    }
    
}
