//
//  FindMedianFromDataStream.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 31/01/25.
//

class FindMedianFromDataStream {
    
    init() {
       // ["MedianFinder","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian"]
        //[[],[6],[],[10],[],[2],[],[6],[],[5],[],[0],[],[6],[],[3],[],[1],[],[0],[],[0],[]]

        runTest()
    }
    
//    6.0
//    8.0
//    6.0
//    6.0
//    6.0
//    5.5
//    6.0
//    5.5
//    5.0
//    4.0
//    3.0
    
    func runTest() {
        let median = MedianFinder()
        median.addNum(6)
        print(median.findMedian())
        
        median.addNum(10)
        print(median.findMedian())
        
        median.addNum(2)
        print(median.findMedian())
        
        median.addNum(6)
        print(median.findMedian())
        
        median.addNum(5)
        print(median.findMedian())
        
        median.addNum(0)
        print(median.findMedian())
        
        median.addNum(6)
        print(median.findMedian())
        
        median.addNum(3)
        print(median.findMedian())
        
        median.addNum(1)
        print(median.findMedian())
        
        median.addNum(0)
        print(median.findMedian())
        
        median.addNum(0)
        print(median.findMedian())
    }
    
}

// MARK: Better Approach
// MARK: Time Complexity: O(N) (Binary search O(log N) + insertion O(N))
// O(1) for find Median
class MedianFinder {

    var nums = [Int]()

    init() {
        
    }
    
    func addNum(_ num: Int) {
        if nums.count == 0 {
            nums.append(num)
            return
        }
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] < num {
                left = mid + 1
            } else if nums[mid] > num {
                right = mid - 1
            } else {
                left = mid + 1
                break
            }
        }
        nums.insert(num, at: left)
        print(nums)
        
    }
    
    func findMedian() -> Double {
        let median = nums.count / 2
        if nums.count % 2 == 0 {
            return (Double(nums[median-1]) + Double(nums[median])) / 2.0
        }
        return Double(nums[median])
    }
    
    
}

// MARK: Time Complexity: O(nlogn) || Space Compelxity: O(n)
class MedianFinder1 {

    var nums = [Int]()

    init() {
        
    }
    
    func addNum(_ num: Int) {
        nums.append(num)
        nums = nums.sorted(by: <)
    }
    
    func findMedian() -> Double {
        if nums.count <= 0 {
            return 0
        }
        
        var slowPointer = 0
        var fastPointer = 0
        while fastPointer < nums.count {
            slowPointer += 1
            fastPointer += 2
        }
        if nums.count % 2 == 0 {
            return (Double(nums[slowPointer-1]) + Double(nums[slowPointer]))/2.0
        }
        return Double(nums[slowPointer-1])
    }
}
