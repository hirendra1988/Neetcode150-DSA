//
//  ReverseInteger.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 01/03/25.
//

//https://neetcode.io/problems/reverse-integer
//https://leetcode.com/problems/reverse-integer/
//https://www.youtube.com/watch?v=HAgLH58IgJQ
class ReverseInteger {
    
    init() {
        //        Example 1:
        //        Input: x = 123
        //        Output: 321
        //
        //        Example 2:
        //        Input: x = -123
        //        Output: -321
        runTest()
    }
    
    func runTest() {
        let x = 1534236469
        let res = reverse(x)
        print(res)
    }
    
    //Time Complexity: O(logx) || Space Compelxity: O(1)
    func reverse(_ x: Int) -> Int {
        var num = x
        var carry = 0
        var res = 0
        let min = Int32.min
        let max = Int32.max
        while num != 0 {
            carry = num % 10
            // Overflow check before updating res
            if res > max / 10 || (res == max / 10 && carry > max % 10) {
                return 0
            }
            
            if res < min / 10 || (res == min / 10 && carry < min % 10)  {
                return 0
            }
            
            res = res*10 + carry
            num = num / 10
        }
        return res
    }
}
