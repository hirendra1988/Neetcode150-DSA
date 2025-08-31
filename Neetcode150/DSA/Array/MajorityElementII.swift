//
//  MajorityElementII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 31/08/25.
//

//https://leetcode.com/problems/majority-element-ii/description/
//https://neetcode.io/problems/majority-element-ii?list=neetcode250
class MajorityElementII {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let nums = [3,2,3]
        let res = majorityElement(nums)
        print(res)
    }
    
    func majorityElement(_ nums: [Int]) -> [Int] {
        var candidate1: Int? = nil
        var candidate2: Int? = nil
        var count1 = 0
        var count2 = 0
        
        for num in nums {
            if let c1 = candidate1, c1 == num {
                count1 += 1
            } else if let c2 = candidate2, c2 == num {
                count2 += 1
            } else if count1 == 0 {
                candidate1 = num
                count1 = 1
            } else if count2 == 0 {
                candidate2 = num
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        
        count1 = 0
        count2 = 0
        for num in nums {
            if candidate1 == num {
                count1 += 1
            } else if candidate2 == num {
                count2 += 1
            }
        }
        
        var thresold = nums.count / 3
        var result = [Int]()
        
        if count1 > thresold {
            if let c1 = candidate1 {
                result.append(c1)
            }
        }
        
        if count2 > thresold {
            if let c2 = candidate2 {
                result.append(c2)
            }
        }
        return result
    }
    
}
