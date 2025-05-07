//
//  KokoEatingBananas.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 24/12/24.
//

import math_h

//https://leetcode.com/problems/koko-eating-bananas/
//https://neetcode.io/problems/eating-bananas
//https://www.youtube.com/watch?v=JGYXNpZaW2U&t=938s
class KokoEatingBananas {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let piles = [3,6,7,11], h = 8
        //Output: 4
        let result = minEatingSpeed(piles, h)
        print(result)
    }
    
    // Time Complexity: O(log(maxPiles) || Space Compelxity: O(1)
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var maxPiles = 0
        for pile in piles {
            maxPiles = max(maxPiles, pile)
        }
        var minSpeed = 1
        var maxSpeed = maxPiles
        
        while minSpeed <= maxSpeed {
            let mid = (minSpeed + maxSpeed) / 2
            if canEatAllBananas(speed: mid, h: h, piles: piles) {
                maxSpeed = mid - 1
            } else {
                minSpeed = mid + 1
            }
        }
        
        return minSpeed
    }
    
    func canEatAllBananas(speed: Int, h: Int, piles: [Int]) -> Bool {
        var hours = 0
        for pile in piles {
            hours += (pile + speed - 1) / speed
            //hours += Int(ceil(Double(pile) / Double(speed)))
        }
        return hours <= h
    }
    
}
