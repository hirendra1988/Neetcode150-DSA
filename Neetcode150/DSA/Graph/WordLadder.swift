//
//  WordLadder.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 18/01/25.
//

//https://leetcode.com/problems/word-ladder/
//https://neetcode.io/problems/word-ladder
class WordLadder {
    
    private let alphabets = "abcdefghijklmnopqrstuvwxyz"
    
    init() {
//        Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
//        Output: 5
//        Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
        runTest()
    }
    
    func runTest() {
        let beginWord = "hit"
        let endWord = "cog"
        let wordList = ["hot","dot","dog","lot","log","cog"]
        let result = ladderLength(beginWord, endWord, wordList)
        print(result)
    }
    
    // Time Complexity: O(N*M^2) || Space Compelxity: O(N)
    // Where N is Number of words in the word list
    // Where M is Length of each word
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if beginWord.count != endWord.count {
            return 0
        }
        var words = Set(wordList)
        var queue = [(String, Int)]()
        queue.append((beginWord, 1))
        
        while !queue.isEmpty {
            let (word, step) = queue.removeFirst()
            if word == endWord {
                return step
            }
            for i in 0..<word.count {
                var charWord = Array(word)
                for char in alphabets where char != charWord[i] {
                    charWord[i] = char
                    let modifiedString = String(charWord)
                    if words.contains(modifiedString) {
                        words.remove(modifiedString)
                        queue.append((modifiedString, step + 1))
                    }
                }
            }
        }
        return 0
    }
    
}
