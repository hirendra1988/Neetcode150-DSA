//
//  TriePrefixTree.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 27/01/25.
//

//https://leetcode.com/problems/implement-trie-prefix-tree/
//https://neetcode.io/problems/implement-prefix-tree
//https://www.youtube.com/watch?v=soJgGe1CQHw
class TriePrefixTree {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let trie = Trie()
        trie.insert("apple")
        print(trie.search("apple"))
        print(trie.search("app"))
        print(trie.startsWith("app"))
        trie.insert("app")
        print(trie.search("app"))
    }
    
}

// MARK: Using Array
class Trie {
    
    class Node {
        var children: [Node?] = [Node?](repeating: nil, count: 26)
        var isEndOfWord: Bool = false
    }
    
    var root: Node = Node()
    
    init() {
        
    }
    
    //    Insert: O(L) time and O(N) space.
    //    Search: O(L) time.
    //    StartsWith: O(L) time.
    //If the word has L characters, the time complexity is O(L).
    
    func insert(_ word: String) {
        let wordChars = Array(word)
        var currentNode: Node = root
        for char in wordChars {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            if currentNode.children[index] == nil {
                let newNode = Node()
                currentNode.children[index] = newNode
            }
            if let tempNode = currentNode.children[index] {
                currentNode = tempNode
            }
        }
        currentNode.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        return searchAndStartWith(word, true)
    }
    
    private func searchAndStartWith(_ word: String, _ isSearch: Bool) -> Bool {
        let wordChars = Array(word)
        var currentNode: Node = root
        for char in wordChars {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            if currentNode.children[index] == nil {
                return false
            }
            if let tempNode = currentNode.children[index] {
                currentNode = tempNode
            }
        }
        return isSearch ? currentNode.isEndOfWord : true
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return searchAndStartWith(prefix, false)
    }
}
