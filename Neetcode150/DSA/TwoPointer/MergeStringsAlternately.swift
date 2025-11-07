//
//  MergeStringsAlternately.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/09/25.
//

//https://leetcode.com/problems/merge-strings-alternately/description/
//https://neetcode.io/problems/merge-strings-alternately?list=neetcode250
class MergeStringsAlternately {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let word1 = "abcd", word2 = "pq"
        let result = mergeAlternately(word1, word2)
        print(result)
    }
    
    // Time Complexity: O(m+n) || Space Compelxity: O(m+n)
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let word1Arr = Array(word1)
        let word2Arr = Array(word2)
        var i = 0, j = 0
        
        var result = ""
        
        while i < word1Arr.count || j < word2Arr.count {
            if i < word1Arr.count {
                result.append(word1Arr[i])
                i += 1
            }
            if j < word2Arr.count {
                result.append(word2Arr[j])
                j += 1
            }
        }
        
        return result
    }
    
}
