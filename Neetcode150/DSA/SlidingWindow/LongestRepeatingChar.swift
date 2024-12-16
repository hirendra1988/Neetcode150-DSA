//
//  LongestRepeatingChar.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 08/12/24.
//

//https://leetcode.com/problems/longest-repeating-character-replacement/
//https://neetcode.io/problems/longest-repeating-substring-with-replacement
class LongestRepeatingChar {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s = "ABAB", k = 2
        let result = characterReplacement(s, k)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var hashMap = [Character: Int]()
        let charArray = Array(s)
        var left = 0
        var maxFreq = 0
        var res = 0
        for right in 0..<charArray.count  {
            hashMap[charArray[right], default: 0] += 1
            maxFreq = max(maxFreq, hashMap[charArray[right], default: 0])
            let window = right - left + 1
            if (window - maxFreq) <= k {
                res = max(res, window)
            } else {
                hashMap[charArray[left], default: 0] -= 1
                left += 1
            }
        }
        return res
    }
    
}
