//
//  LongestCommonPrefix.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 20/08/25.
//

//https://leetcode.com/problems/longest-common-prefix/description/
//https://neetcode.io/problems/longest-common-prefix?list=neetcode250
class LongestCommonPrefix {
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: strs = ["flower","flow","flight"]
//        Output: "fl"
        let strs = ["flower","flow","flight"]
        let result = longestCommonPrefix(strs)
        print(result)
    }

    //Time: O(N * M)
    //Space: O(1) (ignoring output string).
    //Outer loop -> M = length of first string
    // Inner loop -> N = number of strings
    func longestCommonPrefix2(_ strs: [String]) -> String {
        var result = ""
        
        for (i, char) in strs[0].enumerated() {
            for str in strs {
                let charArr = Array(str)
                if i >= charArr.count || charArr[i] != char {
                    return result
                }
            }
            result.append(String(char))
        }
        
        return result
    }
    
    //Space: O(N + M)
    // Time: O(N log N * K + M)
    //K = average string length (needed for lexicographic comparisons).
    func longestCommonPrefix(_ strs: [String]) -> String {
        let sortedStrs = strs.sorted()
        let first = Array(sortedStrs.first!)
        let last = Array(sortedStrs.last!)
        
        var result = ""
        
        for i in 0..<first.count {
            if first[i] != last[i] {
                break
            }
            result.append(first[i])
        }
        return result
    }
    
}
