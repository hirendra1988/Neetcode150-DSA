//
//  VerifyingAlienDictionary.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 15/11/25.
//

class VerifyingAlienDictionary {
    
    init() {
        runTest()
    }
    
//    Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
//    Output: true
    func runTest() {
        let words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
        print(isAlienSorted(words, order))
    }
    
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var hashMap = [Character: Int]()
        let orders = Array(order)
        for i in 0..<orders.count {
            hashMap[orders[i], default: 0] = i
        }
        
        for i in 0..<words.count - 1 {
            let word1 = Array(words[i])
            let word2 = Array(words[i+1])
            var foundDiff = false
            
            for j in 0..<min(word1.count, word2.count) {
                if word1[j] != word2[j] {
                    if hashMap[word1[j]]! > hashMap[word2[j]]! {
                        return false
                    }
                    foundDiff = true
                    break
                }
            }
            
            if !foundDiff && word1.count > word2.count {
                return false
            }
        }
        
        return true
    }
    
}
