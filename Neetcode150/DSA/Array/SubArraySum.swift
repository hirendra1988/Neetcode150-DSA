//
//  SubArraySum.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 07/09/25.
//

//https://leetcode.com/problems/subarray-sum-equals-k/submissions/1762896468/
//https://neetcode.io/problems/subarray-sum-equals-k?list=neetcode250
class SubArraySum {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,3], k = 3
        print(subarraySum(nums, k))
    }
    
    // Prefix sum + hashmap approach
    //Time Complexity: O(n) || Space Compelxity: O(n)
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var hashMap = [0: 1]
        var sum = 0
        var count = 0
        for num in nums {
            sum += num
            count += hashMap[sum - k, default: 0]
            hashMap[sum, default: 0] += 1
        }
        return count
    }
    
    //Time Complexity: O(n^2) || Space Compelxity: O(1)
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var count = 0
        for i in 0..<nums.count {
            sum = 0
            for j in i..<nums.count {
                sum += nums[j]
                if sum == k {
                    count += 1
                }
            }
        }
        return count
    }
    
}
