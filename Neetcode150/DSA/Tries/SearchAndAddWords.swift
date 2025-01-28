//
//  SearchAndAddWords.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 28/01/25.
//

//https://leetcode.com/problems/design-add-and-search-words-data-structure/description/
//https://neetcode.io/problems/design-word-search-data-structure
//https://www.youtube.com/watch?v=6O73KA53ayY
class SearchAndAddWords {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let dict = WordDictionary()
        dict.addWord("bad")
        dict.addWord("dad")
        dict.addWord("mad")
        print(dict.search("pad"))
        print(dict.search("bad"))
        print(dict.search(".ad"))
        print(dict.search("b.."))
    }
    
}

class WordDictionary {
    
    class TrieNode {
        var next: [Character: TrieNode] = [:]
        var isEndOfWord: Bool = false
    }
    
    var root: TrieNode = TrieNode()
    
    init() {
        
    }
    
    func addWord(_ word: String) {
        let wordChars = Array(word)
        var currentNode: TrieNode? = root
        for char in wordChars {
            if currentNode?.next[char] == nil {
                currentNode?.next[char] = TrieNode()
            }
            currentNode = currentNode?.next[char]
        }
        currentNode?.isEndOfWord = true
    }
    
    func dfs(_ s: Int, _ word: String, _ root: TrieNode?) -> Bool {
        let wordChars = Array(word)
        var currentNode: TrieNode? = root
        for i in s..<wordChars.count {
            if wordChars[i] == "." {
                for child in currentNode!.next.values {
                    if dfs(i+1, word, child) {
                        return true
                    }
                }
                return false
            }
            if currentNode?.next[wordChars[i]] == nil {
                return false
            }
            currentNode = currentNode?.next[wordChars[i]]
        }
        return currentNode!.isEndOfWord
    }
    
    func search(_ word: String) -> Bool {
        return dfs(0, word, root)
    }
    
}
