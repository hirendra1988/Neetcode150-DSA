//
//  PlusOne.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 26/02/25.
//

//https://leetcode.com/problems/plus-one/
//https://neetcode.io/problems/plus-one
//https://www.youtube.com/watch?v=Qf2uv_thzs0
class PlusOne {
    
    init() {
//        Input: digits = [1,2,3]
//        Output: [1,2,4]
//        Explanation: The array represents the integer 123.
//        Incrementing by one gives 123 + 1 = 124.
//        Thus, the result should be [1,2,4].
        runTest()
    }
    
    func runTest() {
        let digits = [1,2,3]
        let res = plusOne(digits)
        print(res)
    }
    
    // MARK: Time Complexity: O(n) || Space Compelxity: O(1)
    // Time Complexity: Best case: O(1) (if the last digit is not 9).
    // Time Complexity: Worst case: O(n) (if all digits are 9, requiring a full traversal and insertion).
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in stride(from: digits.count - 1, through: 0, by: -1) {
            if digits[i] == 9 {
                digits[i] = 0
            } else {
                digits[i] += 1
                return digits
            }
        }
        digits.insert(1, at: 0)
        return digits
    }
    
}
