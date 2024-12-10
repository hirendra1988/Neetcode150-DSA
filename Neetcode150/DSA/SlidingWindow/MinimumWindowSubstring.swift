//
//  MinimumWindowSubstring.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 09/12/24.
//

//https://leetcode.com/problems/minimum-window-substring/
//https://neetcode.io/problems/minimum-window-with-characters
//https://www.youtube.com/watch?v=TZlkBWwL0UU
class MinimumWindowSubstring {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s = "ADOBECODEBANC", t = "ABC"
        let result = minWindow(s, t)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(m)
    func minWindow(_ s: String, _ t: String) -> String {
        var hashMap = [Character: Int]()
        let sCharArray = Array(s)
        let tCharArray = Array(t)
        
        for char in tCharArray {
            hashMap[char, default: 0] += 1
        }
        
        var i = 0
        var j = 0
        var minLength = Int.max
        var matched = 0
        var start = 0
        
        while j < sCharArray.count {
            
            //update data
            if let _ = hashMap[sCharArray[j]] {
                hashMap[sCharArray[j], default: 0] -= 1
                if hashMap[sCharArray[j], default: 0] >= 0 {
                    matched += 1
                }
            }
            
            // shrink
            while matched == tCharArray.count {
                if minLength > (j - i + 1) {
                    minLength = j - i + 1
                    start = i
                }
                if let leftChar = hashMap[sCharArray[i]] {
                    if leftChar == 0 {
                        matched -= 1
                    }
                    hashMap[sCharArray[i], default: 0] += 1
                }
                i += 1
            }
            j += 1
        }
        
        return minLength == Int.max ? "" : String(sCharArray[start..<start + minLength])
    }

}
