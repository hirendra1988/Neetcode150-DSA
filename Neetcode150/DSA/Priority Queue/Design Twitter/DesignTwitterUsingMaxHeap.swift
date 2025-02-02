//
//  DesignTwitterUsingMaxHeap.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/02/25.
//

//https://leetcode.com/problems/design-twitter/
//https://neetcode.io/problems/design-twitter-feed
class DesignTwitterUsingMaxHeap {
    init() {
        runTest()
    }
    
    func runTest() {
        let twitter = Twitter()
        twitter.postTweet(1, 5)
        print(twitter.getNewsFeed(1)) // Expected: [5]
        
        twitter.follow(1, 2)
        twitter.postTweet(2, 6)
        print(twitter.getNewsFeed(1)) // Expected: [6, 5]
        
        twitter.unfollow(1, 2)
        print(twitter.getNewsFeed(1)) // Expected: [5]
    }
}

class Twitter3 {
    
    var followers = [Int: Set<Int>]()
    var timeStamp: Int = 0
    var userTweets = [Int: [Tweet3]]()
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        userTweets[userId, default: []].append(Tweet3(tweetId: tweetId, timeStamp: timeStamp))
        timeStamp += 1
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        let maxHeap = MaxHeap3<Tweet3>() // MaxHeap based on timeStamp
        var followees = followers[userId, default: Set()]
        followees.insert(userId) // Include self’s tweets
        
        // Collect all tweets from followees
        for followee in followees {
            if let tweets = userTweets[followee] {
                for tweet in tweets {
                    maxHeap.push(tweet)
                }
            }
        }
        
        // Extract top 10 most recent tweets
        var result = [Int]()
        for _ in 0..<10 {
            if let tweet = maxHeap.pop() {
                result.append(tweet.tweetId)
            } else {
                break
            }
        }
        
        return result // Already in correct order, no need to reverse
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId, default: Set()].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId, default: Set()].remove(followeeId)
    }
}

struct Tweet3: Comparable {
    var tweetId: Int
    var timeStamp: Int
    
    static func < (lhs: Tweet3, rhs: Tweet3) -> Bool {
        return lhs.timeStamp < rhs.timeStamp
    }
}

class MaxHeap3<T: Comparable> {
    private var items = [T]()
    
    func count() -> Int {
        return items.count
    }
    
    func push(_ item: T) {
        items.append(item)
        heapifyUp(items.count - 1)
    }
    
    func pop() -> T? {
        if items.isEmpty {
            return nil
        }
        if items.count == 1 {
            return items.removeFirst()
        }
        let top = items[0]
        items[0] = items.removeLast()
        heapifyDown(0)
        return top
    }
    
    func peek() -> T? {
        return items.first
    }
    
    func heapifyUp(_ i: Int) {
        var largest = i
        let parent = (i - 1) / 2
        if parent >= 0, items[largest] < items[parent] {
            largest = parent
        }
        if largest != parent {
            let temp = items[largest]
            items[largest] = items[parent]
            items[parent] = temp
            heapifyUp(parent)
        }
    }
    
    func heapifyDown(_ i: Int) {
        var largest = i
        let left = 2*i + 1
        let right = 2*i + 2
        if left < items.count, items[left] > items[largest] {
            largest = left
        }
        if right < items.count, items[right] > items[largest] {
            largest = right
        }
        
        if largest != i {
            items.swapAt(largest, i)
            heapifyDown(largest)
        }
    }
    
}
