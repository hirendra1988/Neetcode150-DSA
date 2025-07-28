//
//  Pow(x, n).swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 26/02/25.
//

//https://leetcode.com/problems/powx-n/
//https://neetcode.io/problems/pow-x-n
//https://www.youtube.com/watch?v=1TtWF2ZLNzk
class PowOfxn {
    
    init() {
//        Input: x = 2.00000, n = 10
//        Output: 1024.00000
        runTest()
    }
    
    func runTest() {
        let x = 2.00000, n = 10
        let res = myPow(x, n)
        print(res)
    }
    
    // MARK: Time Complexity: O(logn) || Space Compelxity: O(1)
    func myPow(_ x: Double, _ n: Int) -> Double {
        var a = x
        var b = abs(n)
        var res = 1.0
        while b > 0 {
            if b%2 == 1 {
                res *= a
            }
            a *= a
            b /= 2
        }
        return n < 0 ? 1.0 / res : res
    }
    
}
