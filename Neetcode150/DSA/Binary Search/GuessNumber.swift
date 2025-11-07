//
//  guessNumber.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 07/11/25.
//

//https://leetcode.com/problems/guess-number-higher-or-lower/
//https://neetcode.io/problems/guess-number-higher-or-lower?list=neetcode250
class GuessNumber {
    let guessGame = GuessGame(pick: 6)
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input: n = 10, pick = 6
//        Output: 6
        
        let n = 10, pick = 6
        print(guessNumber(n))
    }

    // Time Complexity: O(log(n) || Space Compelxity: O(1)
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left <= right {
            let mid = (left + right)/2
            let pick = guessGame.guess(mid)
            switch pick {
            case 0:
                return mid
            case 1:
                left = mid + 1
            case -1:
                right = mid-1
            default:
                break
            }
        }
        return 0
    }
    
}

class GuessGame {
    var pick: Int
    
    init(pick: Int) {
        self.pick = pick
    }
    
    func guess(_ num: Int) -> Int {
        if num == pick {
            return 0   // correct
        } else if num > pick {
            return -1  // your guess is higher
        } else {
            return 1   // your guess is lower
        }
    }
}
