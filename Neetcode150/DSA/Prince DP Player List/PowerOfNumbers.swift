//
//  PowerOfNumbers.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/02/25.
//

import math_h

//https://www.youtube.com/watch?v=7sDiQeWsrOk&list=PLzjZaW71kMwSsCT23GFQ-xykAz4uUtYjW&index=4
class PowerOfNumbers {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let n = 12
        let res = powerOfNumber(n: n)
        print(res)
    }
    
    func powerOfNumber1(n: Int) -> Double {
        var originalNumber = n
        var reverseNumber = 0
        var remainder = 0
        while originalNumber != 0 {
            remainder = originalNumber % 10
            reverseNumber = reverseNumber * 10 + remainder
            originalNumber = originalNumber / 10
        }
        
        return pow(Double(n), Double(reverseNumber)) // 4.60051199093697e+22
    }
    
    // Using Recursion
    func powerOfNumber(n: Int) -> Double {
        var originalNumber = n
        var reverseNumber = 0
        var remainder = 0
        while originalNumber != 0 {
            remainder = originalNumber % 10
            reverseNumber = reverseNumber * 10 + remainder
            originalNumber = originalNumber / 10
        }
        return powerOfNumberRecursion(n, reverseNumber)
    }
    
    func powerOfNumberRecursion(_ n: Int, _ reverseNumber: Int) -> Double {
        if n == 0 {
            return 0
        }
        if reverseNumber == 0 {
            return 1
        }
        return Double(n) * powerOfNumberRecursion(n, reverseNumber - 1)
    }
    
}
