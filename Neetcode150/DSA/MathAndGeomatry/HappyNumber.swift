//
//  HappyNumber.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 26/02/25.
//

//https://leetcode.com/problems/happy-number/
//https://neetcode.io/problems/non-cyclical-number
class HappyNumber {
    
    init() {
//        Input: n = 19
//        Output: true
//        Explanation:
//        1^2 + 9^2 = 82
//        8^2 + 2^2 = 68
//        6^2 + 8^2 = 100
//        1^2 + 0^2 + 0^2 = 1
        runTest()
    }
    
    func runTest() {
        let n = 19
        let res = isHappy(n)
        print(res)
    }
    
    // MARK: Time Complexity: O(logn) || Space Compelxity: O(1)
    func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = n
        while true {
            slow = next(slow)
            fast = next(next(fast))
            //fast = next(fast)
            
            if slow == fast {
                break
            }
        }
        return fast == 1
    }
    
    func next(_ n: Int) -> Int {
        var sum = 0
        var num = n
        while num > 0 {
            let remainder = num % 10
            sum += remainder * remainder
            num = num / 10
        }
        return sum
    }
    
    // MARK: Time Complexity: O(logn) || Space Compelxity: O(logn)
    func isHappy1(_ n: Int) -> Bool {
        if n <= 10 {
            return n == 1 || n == 7 || n == 10
        }
        var num = n
        var sum = 0
        while num > 0 {
            let remainder = num % 10
            sum += remainder * remainder
            num = num / 10
        }
        return isHappy(sum)
    }
    
    func isHappy3(_ n: Int) -> Bool {
        var set = Set<Int>()
        return isHappyHelper(n, &set)
    }
    
    func isHappyHelper(_ n: Int, _ set: inout Set<Int>) -> Bool {
        if n == 1 {
            return true
        }
        if set.contains(n) {
            return false
        }
        set.insert(n)
        var n = n
        var res = 0
        while n > 0 {
            let carry = n % 10
            res += carry * carry
            n = n/10
        }
        
        return isHappyHelper(res, &set)
    }
    
}
