//
//  DesignTwitterUsingSorting.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/02/25.
//

class DesignTwitterUsingSorting {
    
    init() {
        runTest()
    }
    
    func runTest() {
        let twitter = Twitter2()
        twitter.postTweet(1, 5)
        print(twitter.getNewsFeed(1)) // Expected: [5]
        
        twitter.follow(1, 2)
        twitter.postTweet(2, 6)
        print(twitter.getNewsFeed(1)) // Expected: [6, 5]
        
        twitter.unfollow(1, 2)
        print(twitter.getNewsFeed(1)) // Expected: [5]
    }
    
}


class Twitter2 {
    var followers = [Int: Set<Int>]()
    var userTweets = [Int: [(Int, Int)]]() // (timestamp, tweetId)
    var timeStamp: Int = 0

    init() {
        
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        userTweets[userId, default: []].append((timeStamp, tweetId))
        timeStamp += 1
    }
    
    // Time Complexity: O(nlogn) || Space Compelxity: O(n)
    func getNewsFeed(_ userId: Int) -> [Int] {
        var followees = followers[userId, default: Set()]
        followees.insert(userId)
        
        var result = [(Int, Int)]()

        for followee in followees {
            if let tweets = userTweets[followee] {
                result.append(contentsOf: tweets)
            }
        }
        
        let sortedResult = result.sorted {
            $0.0 > $1.0
        }
        var finalRes = [Int]()
        for tweet in sortedResult.prefix(10) {
            finalRes.append(tweet.1)
        }
        return finalRes
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId, default: Set()].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followers[followerId, default: Set()].remove(followeeId)
    }
}
