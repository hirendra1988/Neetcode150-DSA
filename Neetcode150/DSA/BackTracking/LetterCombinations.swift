//
//  LetterCombinations.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 03/03/25.
//

//https://leetcode.com/problems/letter-combinations-of-a-phone-number/
//https://neetcode.io/problems/combinations-of-a-phone-number
class LetterCombinations {
    
    var hashMap: [Character: [Character]] =  ["2": ["a", "b", "c"],
                                              "3": ["d", "e", "f"],
                                              "4": ["g", "h", "i"],
                                              "5": ["j", "k", "l"],
                                              "6": ["m", "n", "o"],
                                              "7": ["p", "q", "r", "s"],
                                              "8": ["t", "u", "v"],
                                              "9": ["w", "x", "y", "z"]]
    
    init() {
        //        Input: digits = "23"
        //        Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
        runTest()
    }
    
    func runTest() {
        let digits = "23"
        let res = letterCombinations(digits)
        print(res)
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        var res = [String]()
        var tempSet = ""
        backTracking(digits, &res, &tempSet, 0)
        return res
    }
    
    //Time Complexity: O(4^n) || Space Compelxity: O(4^n * n)
    func backTracking(_ digits: String,
                      _ res: inout [String],
                      _ tempSet: inout String,
                      _ startIndex: Int) {
        if startIndex == digits.count {
            res.append(tempSet)
            return
        }
        let digit = Array(digits)[startIndex]
        if let letters = hashMap[digit] {
            for letter in letters {
                tempSet.append(letter)
                backTracking(digits, &res, &tempSet, startIndex + 1)
                tempSet.removeLast()
            }
        }
    }
    
}
