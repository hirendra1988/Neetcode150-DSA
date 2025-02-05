//
//  Word Break].swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/02/25.
//

//https://leetcode.com/problems/word-break/
//https://neetcode.io/problems/word-break
//https://www.youtube.com/watch?v=hK6Git1o42c
class WordBreak {
    
    init() {
//        Input: s = "leetcode", wordDict = ["leet","code"]
//        Output: true
//        Explanation: Return true because "leetcode" can be segmented as "leet code".

//        Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
//        Output: false
        runTest()
    }
    
    func runTest() {
        let s = "leetcode", wordDict = ["leet","code"]
        let res = wordBreak(s, wordDict)
        print(res)
    }
    
    //Time Complexity: O(n^2) || Space Compelxity: O(n)
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var wordSet = Set(wordDict)
        var maxLength = 0
        for word in wordSet {
            maxLength = max(word.count, maxLength)
        }
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        
        let sChars = Array(s)
        for i in 1...sChars.count {
            for j in stride(from: i - 1, through: max(0, i - maxLength), by: -1) {
                let word = String(sChars[j..<i])
                if dp[j] && wordSet.contains(word) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[sChars.count]
    }
    
}
