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
    
    // Time Complexity: O(m+n) || Space Compelxity: O(1)
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var wordOneIndex = 0
        var wordTwoIndex = 0
        let word1Arr = Array(word1)
        let word2Arr = Array(word2)
        
        var result = ""
        while wordOneIndex < word1Arr.count, wordTwoIndex < word2Arr.count {
            result.append(String(word1Arr[wordOneIndex]))
            result.append(String(word2Arr[wordTwoIndex]))
            
            wordOneIndex += 1
            wordTwoIndex += 1
        }
        
        while wordOneIndex < word1Arr.count {
            result.append(String(word1Arr[wordOneIndex]))
            wordOneIndex += 1
        }
        
        while wordTwoIndex < word2Arr.count {
            result.append(String(word2Arr[wordTwoIndex]))
            wordTwoIndex += 1
        }
        
        return result
    }
    
}
