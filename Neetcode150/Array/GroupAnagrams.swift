//
//  GroupAnagrams.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/12/24.
//

//https://leetcode.com/problems/group-anagrams/
//https://neetcode.io/problems/anagram-groups
class GroupAnagrams {
    
    init() {
        runTest()
    }
    
    //Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
    func runTest() {
        let strs = ["eat","tea","tan","ate","nat","bat"]
        let result = groupAnagrams(strs)
        print(result)
    }
    
    //Time Complexity: O(n * k) || Space Compelxity: O(n * k)
    //let n be the number of strings and k be the average length of a string.
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashMap = [[Character: Int]: [String]]()
        for str in strs {
            var keyCharHashMap = [Character: Int]()
            for char in str {
                keyCharHashMap[char, default: 0] += 1
            }
            hashMap[keyCharHashMap, default: []].append(str)
        }
        return Array(hashMap.values)
    }
    
    // Time Complexity: O(n * mlogm) || Space Compelxity: O(n*m)
    func groupAnagrams2(_ strs: [String]) -> [[String]] {
        var result = [String: [String]]()
        for str in strs {
            result["\(str.sorted())", default: []] += [str]
        }
        return Array(result.values)
    }
}
