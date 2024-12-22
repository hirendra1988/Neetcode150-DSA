//
//  StackDSA.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 21/12/24.
//

class StackDSA {
    
    init() {
        runTest()
    }
    
    func runTest() {
        // Output for prev greater: [-1, 15, -1, 18, 12, 12, 6, 12]
        //        let array = [15,10,18,12,4,6,2,8] // Prev Greater
        //        let res = prevGreaterElement(array: array)
        
        // Output for prev smaller [-1, -1, 10, 10, -1, 4, -1, 2]
//        let array = [15,10,18,12,4,6,2,8] // Prev Greater
//        let res = prevSmallerElement(array: array)
        
        
//         //Output for next greater: [18, 18, -1, -1, 6, 8, 8, -1]
//        let array = [15,10,18,12,4,6,2,8] // next Greater
//        let res = nextGreaterElement(array: array)
        
        //Output for next smaller: [10,4,12,4,2,2,-1,-1]
       let array = [15,10,18,12,4,6,2,8] // next Smallest
                 
       let res = nextSmallerElement(array: array)
        
        print(res)
    }
    
    // MARK: Previous greater element
    func prevGreaterElement(array: [Int]) -> [Int] {
        var stack = [Int]()
        var result = [Int]()
        result.append(-1)
        stack.append(array[0])
        
        for i in 1..<array.count {
            while !stack.isEmpty, stack.last! <= array[i] {
                stack.popLast()
            }
            if stack.isEmpty {
                result.append(-1)
            } else {
                result.append(stack.last!)
            }
            stack.append(array[i])
        }
        return result
    }
    
    // MARK: Previous smaller element
    func prevSmallerElement(array: [Int]) -> [Int] {
        var stack = [Int]()
        var result = [Int]()
        stack.append(array[0])
        result.append(-1)
        
        for i in 1..<array.count {
            while !stack.isEmpty, stack.last! >= array[i] {
                stack.popLast()
            }
            if stack.isEmpty {
                result.append(-1)
            } else {
                result.append(stack.last!)
            }
            stack.append(array[i])
        }
        return result
    }
    
    // MARK: Next greater element
    func nextGreaterElement(array: [Int]) -> [Int] {
        var stack = [Int]()
        var result = [Int](repeating: 0, count: array.count)
        stack.append(array[array.count - 1])
        result[array.count - 1] = -1
        
        for i in stride(from: array.count - 2, through: 0, by: -1) {
            
            while !stack.isEmpty, stack.last! <= array[i] {
                stack.popLast()
            }
            if stack.isEmpty {
                result[i] = -1
            } else {
                result[i] = stack.last!
            }
            
            stack.append(array[i])
        }
        return result
    }
    
    // MARK: Next smaller element
    func nextSmallerElement(array: [Int]) -> [Int] {
        var stack = [Int]()
        var result = [Int](repeating: 0, count: array.count)
        stack.append(array[array.count - 1])
        result[array.count - 1] = -1
        
        for i in stride(from: array.count - 2, through: 0, by: -1) {
            
            while !stack.isEmpty, stack.last! >= array[i] {
                stack.popLast()
            }
            if stack.isEmpty {
                result[i] = -1
            } else {
                result[i] = stack.last!
            }
            
            stack.append(array[i])
        }
        return result
    }
    
}
