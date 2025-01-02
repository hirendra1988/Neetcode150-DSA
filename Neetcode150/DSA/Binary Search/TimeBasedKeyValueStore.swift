//
//  TimeBasedKeyValueStore.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/01/25.
//

//https://leetcode.com/problems/time-based-key-value-store/
//https://neetcode.io/problems/time-based-key-value-store
class TimeBasedKeyValueStore {
    
    var hashMap = [String: [(String, Int)]]()
    
    init() {
        runTest()
    }
    
    func runTest() {
//        Input
//        ["TimeMap", "set", "get", "get", "set", "get", "get"]
//        [[], ["foo", "bar", 1], ["foo", 1], ["foo", 3], ["foo", "bar2", 4], ["foo", 4], ["foo", 5]]
        
//        Output
//        [null, null, "bar", "bar", null, "bar2", "bar2"]
//
//        Explanation
//        TimeMap timeMap = new TimeMap();
//        timeMap.set("foo", "bar", 1);  // store the key "foo" and value "bar" along with timestamp = 1.
//        timeMap.get("foo", 1);         // return "bar"
//        timeMap.get("foo", 3);         // return "bar", since there is no value corresponding to foo at timestamp 3 and timestamp 2, then the only value is at timestamp 1 is "bar".
//        timeMap.set("foo", "bar2", 4); // store the key "foo" and value "bar2" along with timestamp = 4.
//        timeMap.get("foo", 4);         // return "bar2"
//        timeMap.get("foo", 5);         // return "bar2"
        
//        set("foo", "bar", 1)
//        print(get("foo", 1))
//        print(get("foo", 3))
//        set("foo", "bar2", 4)
//        print(get("foo", 4))
//        print(get("foo", 5))
//        
        
        
        
//        ["TimeMap","set","set","get","get","get","get","get"]
//        [[],["love","high",10],["love","low",20],["love",5],["love",10],["love",15],["love",20],["love",25]]
        
//        Output
        //[null,null,null,"","high","high","low","low"]
        
        set("love", "high", 10)
        set("love", "low", 20)
        print(get("love", 5)) // low
        print(get("love", 10)) // low
        print(get("love", 15)) // low
        print(get("love", 20)) // low
        print(get("love", 25))// low
        
    }
    
    // Time Complexity: O(1)
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        hashMap[key, default: []].append((value, timestamp))
    }
    
    // Time Complexity: O(logn)
    func get(_ key: String, _ timestamp: Int) -> String {
        var result = ""
        if let tuplesArr = hashMap[key], tuplesArr.count > 0 {
            var left = 0
            var right = tuplesArr.count - 1
            while left <= right {
                let mid = (left+right)/2
                if tuplesArr[mid].1 <= timestamp {
                    result = tuplesArr[mid].0
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return result
    }
    
    // Time Complexity: O(n)
    func get1(_ key: String, _ timestamp: Int) -> String {
        var result = ""
        var tempTimeStamp = Int.min
        if let tuplesArr = hashMap[key], tuplesArr.count > 0 {
            for i in 0..<tuplesArr.count {
                if tuplesArr[i].1 > tempTimeStamp, tuplesArr[i].1 <= timestamp {
                    tempTimeStamp = tuplesArr[i].1
                    result = tuplesArr[i].0
                }
            }
        }
        return result
    }
    
}
