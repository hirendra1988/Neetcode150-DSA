//
//  PalindromePartitioning.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/03/25.
//

//https://leetcode.com/problems/palindrome-partitioning/
//https://neetcode.io/problems/palindrome-partitioning
class PalindromePartitioning {
    
    init() {
        //        Input: s = "aab"
        //        Output: [["a","a","b"],["aa","b"]]
        runTest()
    }
    
    func runTest() {
        let s = "aab"
        let res = partition(s)
        print(res)
    }
    
    //Time Complexity: O(2^n * n) || Space Compelxity: O(2^n * n) 
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var tempSet = [String]()
        backTracking(s, &result, &tempSet, 0)
        return result
    }
    
    func backTracking(_ s: String,
                      _ res: inout [[String]],
                      _ tempSet: inout [String],
                      _ startIndex: Int) {
        if startIndex == s.count {
            res.append(tempSet)
            return
        }
        
        for end in startIndex..<s.count {
            let str = String(Array(s)[startIndex...end])
            if isPallingdrome(str) {
                tempSet.append(str)
                backTracking(s, &res, &tempSet, end+1)
                tempSet.removeLast()
            }
        }
    }
    
    func isPallingdrome(_ s: String) -> Bool {
        let sChars = Array(s)
        var left = 0
        var right = sChars.count - 1
        while left < right {
            if sChars[left] != sChars[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
}
