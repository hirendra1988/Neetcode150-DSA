//
//  DetectSquares.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 27/02/25.
//

//https://leetcode.com/problems/detect-squares/
//https://neetcode.io/problems/count-squares
class DetectSquaresTest {
    
    init() {
//        Input
//        ["DetectSquares", "add", "add", "add", "count", "count", "add", "count"]
//        [[], [[3, 10]], [[11, 2]], [[3, 2]], [[11, 10]], [[14, 8]], [[11, 2]], [[11, 10]]]
//        Output
//        [null, null, null, null, 1, 0, null, 2]
        runTest()
    }
    
    func runTest() {
        let detectSquare = DetectSquares()
        detectSquare.add([3,10])
        detectSquare.add([11,2])
        detectSquare.add([3,2])
        print(detectSquare.count([11, 10]))
        print(detectSquare.count([14, 8]))
        detectSquare.add([11,2])
        print(detectSquare.count([11, 10]))
    }
    
}

class DetectSquares {

    var hashMap = [[Int]: Int]()

    init() {
        
    }
    
    // MARK: Time Complexity: O(1) || Space Compelxity: O(n)
    func add(_ point: [Int]) {
        hashMap[point, default: 0] += 1
    }
    
    // MARK: Time Complexity: O(n) || Space Compelxity: O(n)
    func count(_ point: [Int]) -> Int {
        var result = 0
        for (key, value) in hashMap {
            if key == point {
                continue
            }
            if abs(point[0] - key[0]) != abs(point[1] - key[1]) {
                continue
            }
            let point1 = [point[0], key[1]]
            let point2 = [key[0], point[1]]
            
            guard let numPoint1 = hashMap[point1] else { continue }
            guard let numPoint2 = hashMap[point2] else { continue }
            result += value * numPoint1 * numPoint2
        }
        return result
    }
}
