//
//  ReverseBits.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 28/02/25.
//

//https://leetcode.com/problems/reverse-bits/
//https://neetcode.io/problems/reverse-bits
//https://www.youtube.com/watch?v=LJiMk8lPJNc
class ReverseBits {
    
    init() {
        //        Input: n = 00000010100101000001111010011100
        //        Output:    964176192 (00111001011110000010100101000000)
        //        Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
        runTest()
    }
    
    func runTest() {
        let n: Int32 = 0b00000010100101000001111010011100
        let res = reverseBits(n)
        print(res)
    }
    
    //Time Complexity: O(1) || Space Compelxity: O(1)
    func reverseBits(_ n: Int32) -> Int32 {
        var res: Int32 = 0
        var num = n
        for i in 1...32 {
            let lsb = num & 1 //Get the least significant bit
            let reverseLsb = lsb << (32-i) // // Reverse the bit position
            res = res | reverseLsb // Set the reversed bit
            num = num >> 1 // Right shift the number
        }
        return res
    }
    
}
