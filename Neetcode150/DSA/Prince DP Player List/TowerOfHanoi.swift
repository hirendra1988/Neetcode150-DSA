//
//  TowerOfHanoi.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 06/02/25.
//

//https://www.geeksforgeeks.org/c-program-for-tower-of-hanoi/
//https://www.youtube.com/watch?v=CfUmdjJwxL4&list=PLzjZaW71kMwSsCT23GFQ-xykAz4uUtYjW&index=10
class TowerOfHanoi {
    
    var count = 0
    
    init() {
        //int N = 3;
        // A, B and C are names of rods
        //towerOfHanoi(N, 'A', 'C', 'B');
        runTest()
    }
    
    func runTest() {
        let n = 3
        towerOfHanoi(n, "A", "C", "B")
        print(count)
    }
    
    func towerOfHanoi(_ n: Int, _ from: Character, _ to: Character, _ aux: Character) {
        if n <= 0 {
            return
        }
        towerOfHanoi(n-1, from, aux, to)
        count += 1
        towerOfHanoi(n-1, aux, to, from)
    }
    
}
