//
//  ViewController.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 02/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //TicTacToe()
//        let s = "baa", p = "aa"
//        print(findAnagrams(s, p))
        
//        Input: ["tea", "ate", "bat", "tab", "cat", "dog"]
//        Output: ["cat", "dog"]
//        let words = ["tea", "ate", "bat", "tab", "cat", "dog"]
//        let uniqueWords = uniqueWords(words: words)
//        print(uniqueWords)
        
        AngleBetweenHandsOfClock()
    }
    
    func uniqueWords(words: [String]) -> [String] {
        var hashMap = [String: [String]]()
        var result = [String]()
        for word in words {
            hashMap[String(word.sorted()), default: []] += [word]
        }
        for (key, value) in hashMap {
            if value.count == 1 {
                result.append(value[0])
            }
        }
        return result
    }

}
