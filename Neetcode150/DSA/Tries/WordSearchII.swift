//
//  WordSearchII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 28/01/25.
//

//https://leetcode.com/problems/word-search-ii/
//https://neetcode.io/problems/search-for-word-ii
class WordSearchII {
    
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var word: String?
    }
    
    var root: TrieNode = TrieNode()
    
    init() {
        //        Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
        //        Output: ["eat","oath"]
        runTest()
    }
    
    func runTest() {
        let board: [[Character]] = [["o","a","a","n"],
                                    ["e","t","a","e"],
                                    ["i","h","k","r"],
                                    ["i","f","l","v"]]
        let words = ["oath","pea","eat","rain"]
        let result = findWords(board, words)
        print(result)
    }
    
    //Time Complexity: O(n*k + m*p*4^L)
    //Space Complexity: O(n*k + L)
    // n*k is the cost of building the Trie.
    // m*p*4^L is the cost of searching for words in the board
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        if board.isEmpty {
            return []
        }
        for word in words {
            addWord(word)
        }
        var board = board
        let rows = board.count
        let cols = board[0].count
        var result = [String]()
        
        for row in 0..<rows {
            for col in 0..<cols {
                dfs(&board, row, col, &result, root)
            }
        }
        return result
    }
    
    func dfs(_ board: inout [[Character]],
             _ row: Int,
             _ col: Int,
             _ result: inout [String],
             _ root: TrieNode) {
        let rows = board.count
        let cols = board[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols || board[row][col] == "0" {
            return
        }
        guard let currentNode = root.children[board[row][col]] else {
            return
        }
        
        if let word = currentNode.word {
            result.append(word)
            currentNode.word = nil
        }
        let char = board[row][col]
        board[row][col] = "0"
        
        dfs(&board, row-1, col, &result, currentNode)
        dfs(&board, row+1, col, &result, currentNode)
        dfs(&board, row, col-1, &result, currentNode)
        dfs(&board, row, col+1, &result, currentNode)
        board[row][col] = char
    }
    
    func addWord(_ word: String) {
        let wordChars = Array(word)
        var currentNode: TrieNode? = root
        for char in wordChars {
            if currentNode?.children[char] == nil {
                currentNode?.children[char] = TrieNode()
            }
            currentNode = currentNode?.children[char]
        }
        currentNode?.word = word
    }
    
}
