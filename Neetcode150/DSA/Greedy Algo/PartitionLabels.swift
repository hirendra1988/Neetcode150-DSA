//
//  PartitionLabels.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 20/02/25.
//

//https://leetcode.com/problems/partition-labels/
//https://neetcode.io/problems/partition-labels
//https://www.youtube.com/watch?v=aUVEMnlcw4E&t=803s
class PartitionLabels {
    
    init() {
//        Input: s = "ababcbacadefegdehijhklij"
//        Output: [9,7,8]
//        Explanation:
//        The partition is "ababcbaca", "defegde", "hijhklij".
//        This is a partition so that each letter appears in at most one part.
//        A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.
        runTest()
    }
    
    func runTest() {
        let s = "ababcbacadefegdehijhklij"
        let result = partitionLabels(s)
        print(result)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func partitionLabels(_ s: String) -> [Int] {
        var hashMap = [Character: Int]()
        let sChars = Array(s)
        for i in 0..<sChars.count {
            hashMap[sChars[i], default: 0] = i
        }
        
        var left = 0, right = 0
        var res = [Int]()
        for i in 0..<sChars.count {
            right = max(right, hashMap[sChars[i]]!)
            if right == i {
                res.append(right - left + 1)
                left = right + 1
            }
        }
        return res
    }
    
}
