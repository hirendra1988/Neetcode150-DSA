//
//  EncodeDecodeStrings.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/12/24.
//

//https://neetcode.io/problems/string-encode-and-decode
//https://leetcode.com/problems/encode-and-decode-strings/
class EncodeDecodeStrings {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let encodeStr = encode2(["Hello","World"])
        print(encodeStr)
        let decodeStr = decode2(encodeStr)
        print(decodeStr)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func encode(_ strs: [String]) -> String {
        var encodeStr = ""
        for str in strs {
            encodeStr.append(str)
            encodeStr.append("🤪")
        }
        return encodeStr
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func decode(_ s: String) -> [String] {
        var words = ""
        let sChar = Array(s)
        var result = [String]()
        for char in sChar {
            if char == "🤪" {
                result.append(words)
                words = ""
            } else {
                words.append(char)
            }
        }
        return result
    }
    
    
    // ********************* Second Approach ****************************
    func encode2(_ strs: [String]) -> String {
        return strs.joined(separator: "@#$%^")
    }
    
    func decode2(_ s: String) -> [String] {
        return s.components(separatedBy: "@#$%^")
    }
    
}
