//
//  TaskScheduler.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 31/01/25.
//

//https://leetcode.com/problems/task-scheduler/
//https://neetcode.io/problems/task-scheduling
//https://www.youtube.com/watch?v=p1usK_Cb8uE
class TaskScheduler {
    
    init() {
        //        Input: tasks = ["A","A","A","B","B","B"], n = 2
        //        Output: 8
        runTest()
    }
    
    func runTest() {
        let tasks: [Character] = ["A","A","A","B","B","B"], n = 2
        let res = leastInterval(tasks, n)
        print(res)
    }
    
    // Time Complexity: O(n) || Space Compelxity: O(1)
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var freqArr = [Int](repeating: 0, count: 26)
        for task in tasks {
            let index = Int(task.asciiValue! - Character("A").asciiValue!)
            freqArr[index] += 1
        }
        let maxFreq = freqArr.max()!
        let maxFreqCount = freqArr.filter { $0 == maxFreq }.count
        let idleTime = (maxFreq - 1) * (n + 1) + maxFreqCount
        return max(idleTime, tasks.count)
    }
    
    func leastInterval2(_ tasks: [Character], _ n: Int) -> Int {
        var hashMap = [Character: Int]()
        var maxFreq = 0
        for task in tasks {
            hashMap[task, default: 0] += 1
            maxFreq = max(maxFreq, hashMap[task]!)
        }
        var maxFreqCount = 0
        for (task, count) in hashMap {
            if maxFreq == count {
                maxFreqCount += 1
            }
        }
        let idleTime = (maxFreq - 1) * (n + 1) + maxFreqCount
        return max(idleTime, tasks.count)
    }
    
}
