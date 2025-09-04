//
//  ContainsDuplicateII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 04/09/25.
//

//https://www.youtube.com/watch?v=ypn0aZ0nrL4
//https://leetcode.com/problems/contains-duplicate-ii/
//https://neetcode.io/problems/contains-duplicate-ii?list=neetcode250
class ContainsDuplicateII {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [1,2,3,1], k = 3
        print(containsNearbyDuplicate(nums, k))
    }
    
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var hashMap = [Int: Int]()
        for i in 0..<nums.count {
            if let index = hashMap[nums[i]] {
                if abs(index - i) <= k {
                    return true
                } else {
                    hashMap[nums[i]] = i
                }
            } else {
                hashMap[nums[i]] = i
            }
        }
        return false
    }
    
}
