//
//  HandOfStraights.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 18/02/25.
//

//https://leetcode.com/problems/hand-of-straights/
//https://neetcode.io/problems/hand-of-straights
class HandOfStraights {
    
    init() {
//        Input: hand = [1,2,3,6,2,3,4,7,8], groupSize = 3
//        Output: true
//        Explanation: Alice's hand can be rearranged as [1,2,3],[2,3,4],[6,7,8]
        runTest()
    }
    
    func runTest() {
        let hand = [1,2,3,6,2,3,4,7,8], groupSize = 3
        let res = isNStraightHand(hand, groupSize)
        print(res)
    }
    
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        if hand.count % groupSize != 0 {
            return false
        }
        var hashMap = [Int: Int]()
        for val in hand {
            hashMap[val, default: 0] += 1
        }
        let sortedKeys = hashMap.keys.sorted()
        
        for key in sortedKeys {
            guard let count = hashMap[key], count > 0 else {
                continue
            }
            for i in 0..<groupSize {
                let newKey = key + i
                if let numCount = hashMap[newKey], numCount >= count {
                    hashMap[newKey]! -= count
                } else {
                    return false
                }
            }
        }
        return true
        
    }
    
}
