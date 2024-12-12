//
//  FindKClosestElements.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 12/12/24.
//

//https://leetcode.com/problems/find-k-closest-elements/
class FindKClosestElements {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let arr = [1,2,3,4,5], k = 4, x = 3 //Output: [1,2,3,4]
        let result = findClosestElements(arr, k, x)
        print(result)
    }
    
    // Time Complexity: O(log(n-k) || Space Compelxity: O(1)
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        while left < right {
            let mid = left + (right - left) / 2
            if (x - arr[mid]) > arr[mid+k] - x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return Array(arr[left..<left+k])
    }

    // Time Complexity: O(n) || Space Compelxity: O(k)
    func findClosestElements2(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var window = [Int]()
        for right in 0..<arr.count {
            if window.count == k {
                if abs(arr[right] - x) < abs(arr[left] - x) {
                    window.removeFirst()
                    left += 1
                    window.append(arr[right])
                }
            } else {
                window.append(arr[right])
            }
        }
        return window
    }
    
}
