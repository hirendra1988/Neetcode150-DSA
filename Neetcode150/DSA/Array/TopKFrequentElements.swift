//
//  TopKFrequentElements.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/12/24.
//

//https://leetcode.com/problems/top-k-frequent-elements/
//https://neetcode.io/problems/top-k-elements-in-list
class TopKFrequentElements {
    
    init() {
        runTest()
    }
    
    // Output: [1,2]
    func runTest() {
        let nums = [1,1,1,2,2,3]
        let k = 2
        let result = topKFrequent(nums, k)
        print(result)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(n)
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var hashMap = [Int: Int]()
        for num in nums {
            hashMap[num, default: 0] += 1
        }
        var maxFreq = 0
        for (_, value) in hashMap {
            maxFreq = max(maxFreq, value)
        }
        var bucket = [[Int]](repeating: [Int](), count: maxFreq + 1)
        for (key, value) in hashMap {
            bucket[value].append(key)
        }
        var result = [Int]()
        for i in stride(from: bucket.count - 1, through: 0, by: -1) {
            result.append(contentsOf: bucket[i])
            if result.count == k {
                break
            }
        }
        return result
    }
    
    // Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func topKFrequent2(_ nums: [Int], _ k: Int) -> [Int] {
        var hashMap = [Int: Int]()
        for num in nums {
            hashMap[num, default: 0] += 1
        }
        let sortedNums = hashMap.sorted { $0.value > $1.value }
        var res = [Int]()
        
        for (key, value) in sortedNums {
            res.append(key)
            if res.count == k {
                break
            }
        }
        return res
    }
    
}
