//
//  LongestSubstring.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 08/12/24.
//

//https://leetcode.com/problems/longest-substring-without-repeating-characters/
//https://neetcode.io/problems/longest-substring-without-duplicates
class LongestSubstring {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s = "abcabcbb"
        let result = lengthOfLongestSubstring(s)
        print(result)
    }
   
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var hashMap = [Character: Int]()
        var longest = 0
        var startIndex = 0
        for (index, char) in s.enumerated() {
            if let foundIndex = hashMap[char] {
                startIndex = max(foundIndex + 1, startIndex)
            }
            longest = max(longest, index - startIndex + 1)
            hashMap[char] = index
        }
        print(String(hashMap.keys))
        return longest
    }
    
}
