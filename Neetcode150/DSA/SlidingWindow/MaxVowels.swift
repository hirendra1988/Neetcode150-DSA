//
//  MaxVowels.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 11/12/24.
//

//https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/
//https://www.youtube.com/watch?v=FEXJGn19u7Y
class MaxVowels {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let s = "abciiidef", k = 3 // Output: 3
        let result = maxVowels(s, k)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let charArray = Array(s)
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        
        var maxVowels = 0
        var vowelCount = 0
        
        // Initialize the first window of size k
        for i in 0..<k {
            if vowels.contains(charArray[i]) {
                vowelCount += 1
            }
        }
        
        maxVowels = vowelCount
        
        // Slide the window across the string
        for j in k..<charArray.count {
            // Remove the effect of the character going out of the window
            if vowels.contains(charArray[j - k]) {
                vowelCount -= 1
            }
            // Add the effect of the new character entering the window
            if vowels.contains(charArray[j]) {
                vowelCount += 1
            }
            maxVowels = max(maxVowels, vowelCount)
        }
        return maxVowels
    }
    
    // Time Complexity: O(n * k) || Space Compelxity: O(n)
    func maxVowels2(_ s: String, _ k: Int) -> Int {
        let charArray = Array(s)
        var maxVowels = 0
        var count = 0
        for i in 0...charArray.count - k {
            count = 0
            for j in i..<i+k {
                if charArray[j] == "a" || charArray[j] == "e" ||
                    charArray[j] == "i" || charArray[j] == "o" ||
                    charArray[j] == "u" {
                    count += 1
                }
            }
            maxVowels = max(maxVowels, count)
        }
        return maxVowels
    }
    
}
