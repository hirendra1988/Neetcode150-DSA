//
//  WordSearch.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/03/25.
//

//https://leetcode.com/problems/word-search/
//https://neetcode.io/problems/search-for-word
class WordSearch {
    
    init() {
        //        Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
        //        Output: true
        runTest()
    }
    
    func runTest() {
        let board: [[Character]] = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
        let word = "ABCCED"
        let res = exist(board, word)
        print(res)
    }
    
    // Using DFS + Backtrack
    //Time Complexity: O(rows * cols * 4^n) || Space Compelxity: O(rows * cols)
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        let words = Array(word)
        for i in 0..<rows {
            for j in 0..<cols {
                if dfs(board, words, &visited, i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func dfs(_ board: [[Character]],
             _ words: [Character],
             _ visited: inout [[Bool]],
             _ row: Int,
             _ col: Int,
             _ index: Int) -> Bool {
        if index == words.count {
            return true
        }
        let rows = board.count
        let cols = board[0].count
        if row < 0 || row >= rows || col < 0 || col >= cols
            || visited[row][col]
            || board[row][col] != words[index] {
            return false
        }
        visited[row][col] = true
        let hasValidPath = dfs(board, words, &visited, row + 1, col, index + 1)
        || dfs(board, words, &visited, row-1, col, index + 1)
        || dfs(board, words, &visited, row, col+1, index + 1)
        || dfs(board, words, &visited, row, col-1, index + 1)
        visited[row][col] = false // for Backtrack
        return hasValidPath
    }
    
}
