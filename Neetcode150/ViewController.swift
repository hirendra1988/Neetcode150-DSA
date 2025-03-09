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
        
        //AlienDictionary()
        print(isHappy(19))
       
    }
    
    func isHappy(_ n: Int) -> Bool {
        if n == 1 || n == 7 || n == 10 {
            return true
        }
        var tempNum = 0
        var num = n
        while num > 0 {
            let remainder = num % 10
            tempNum += remainder * remainder
            num = num/10
        }
        return isHappy(tempNum)
    }

}


