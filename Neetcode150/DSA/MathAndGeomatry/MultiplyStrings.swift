//
//  MultiplyStrings.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 27/02/25.
//

//https://leetcode.com/problems/multiply-strings/
//https://neetcode.io/problems/multiply-strings
class MultiplyStrings {
    
    init() {
//        Example 1:
//        Input: num1 = "2", num2 = "3"
//        Output: "6"
//        
//        Example 2:
//        Input: num1 = "123", num2 = "456"
//        Output: "56088"
        runTest()
    }
    // 123
    // 456
//    [1, 2, 3]
//    [4, 5, 6]
    func runTest() {
        //let num1 = "123", num2 = "456"
        let num1 = "2", num2 = "3"
        let res = multiply(num1, num2)
        print(res)
    }
    
    // MARK: Time Complexity: O(m*n) || Space Compelxity: O(m+n)
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        var result = [Int](repeating: 0, count: num1.count + num2.count)
        let num1Arr = Array(num1).map { Int(String($0))! }
        let num2Arr = Array(num2).map { Int(String($0))! }
       
        for i in stride(from: num1Arr.count - 1, through: 0, by: -1) {
            for j in stride(from: num2Arr.count - 1, through: 0, by: -1) {
                let multi = num1Arr[i] * num2Arr[j]
                let sum = multi + result[i+j+1]
                result[i+j+1] = sum % 10
                result[i+j] += sum / 10
            }
        }
        
        while result.first == 0 {
            result.removeFirst()
        }
    
        return result.map { String($0) }.joined()
    }
    
}
