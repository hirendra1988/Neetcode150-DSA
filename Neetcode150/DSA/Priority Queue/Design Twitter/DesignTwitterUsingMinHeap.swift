//
//  DesignTwitterUsingMinHeap.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/02/25.
//

//https://leetcode.com/problems/design-twitter/
//https://neetcode.io/problems/design-twitter-feed
class DesignTwitterUsingMinHeap {
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

class Twitter {
    private var followers = [Int: Set<Int>]()
    private var userTweets = [Int: [Tweet]]()
    private var timeStamp = 0
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        let tweet = Tweet(tweetId: tweetId, timeStamp: timeStamp) // Fixed tweetId assignment
        timeStamp += 1
        userTweets[userId, default: []].append(tweet)
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        let minHeap = MinHeap<Tweet>()
        var followees = followers[userId, default: Set()] // Include self-follow manually
        followees.insert(userId) // Ensure user always sees their own tweets
        
        for followee in followees {
            if let tweets = userTweets[followee] {
                for tweet in tweets {
                    if minHeap.count < 10 {
                        minHeap.push(tweet)
                    } else if let peek = minHeap.peek(), tweet.timeStamp > peek.timeStamp {
                        _ = minHeap.pop()
                        minHeap.push(tweet)
                    }
                }
            }
        }
        
        var result = [Int]()
        while let tweet = minHeap.pop() {
            result.append(tweet.tweetId)
        }
        return result.reversed() // Reverse to get descending order
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId, default: Set()].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId]?.remove(followeeId)
    }
}

struct Tweet: Comparable {
    let tweetId: Int
    let timeStamp: Int
    
    static func < (lhs: Tweet, rhs: Tweet) -> Bool {
        return lhs.timeStamp < rhs.timeStamp
    }
}

class MinHeap<T: Comparable> {
    private var items = [T]()
    
    var count: Int {
        return items.count
    }
    
    func push(_ item: T) {
        items.append(item)
        heapifyUp(items.count - 1)
    }
    
    func pop() -> T? {
        guard !items.isEmpty else { return nil }
        if items.count == 1 { return items.removeFirst() }
        
        let top = items[0]
        items[0] = items.removeLast()
        heapifyDown(0)
        return top
    }
    
    func peek() -> T? {
        return items.first
    }

    private func heapifyUp(_ i: Int) {
        var smallest = i
        let parentIdx = (i - 1) / 2

        if parentIdx >= 0, items[i] < items[parentIdx] {
            smallest = parentIdx
        }

        if smallest != i {
            items.swapAt(smallest, i)
            heapifyUp(parentIdx)
        }
    }
    
    private func heapifyDown(_ i: Int) {
        var smallest = i
        let left = 2 * i + 1
        let right = 2 * i + 2
        
        if left < items.count, items[left] < items[smallest] {
            smallest = left
        }
        if right < items.count, items[right] < items[smallest] {
            smallest = right
        }
        if smallest != i {
            items.swapAt(smallest, i)
            heapifyDown(smallest)
        }
    }
}
