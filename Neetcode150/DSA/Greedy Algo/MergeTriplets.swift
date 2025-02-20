//
//  MergeTriplets.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 20/02/25.
//

//https://leetcode.com/problems/merge-triplets-to-form-target-triplet/
//https://neetcode.io/problems/merge-triplets-to-form-target
class MergeTriplets {
    
    init() {
//        Input: triplets = [[2,5,3],[1,8,4],[1,7,5]], target = [2,7,5]
//        Output: true
//        Explanation: Perform the following operations:
//        - Choose the first and last triplets [[2,5,3],[1,8,4],[1,7,5]]. Update the last triplet to be [max(2,1), max(5,7), max(3,5)] = [2,7,5]. triplets = [[2,5,3],[1,8,4],[2,7,5]]
//        The target triplet [2,7,5] is now an element of triplets.
        runTest()
    }
    
    func runTest() {
        let triplets = [[2,5,3],[1,8,4],[1,7,5]], target = [2,7,5]
        let result = mergeTriplets(triplets, target)
        print(result)
    }
    
    //Time Complexity: O(n) || Space Compelxity: O(1)
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var result = [false, false, false]
        for t in triplets {
            if t[0] > target[0] || t[1] > target[1] || t[2] > target[2] {
                continue
            }
            if t[0] == target[0] {
                result[0] = true
            }
            if t[1] == target[1] {
                result[1] = true
            }
            if t[2] == target[2] {
                result[2] = true
            }
        }
        return result[0] && result[1] && result[2]
    }
    
}
