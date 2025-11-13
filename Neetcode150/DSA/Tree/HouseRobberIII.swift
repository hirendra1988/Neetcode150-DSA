//
//  HouseRobberIII.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 13/11/25.
//

//https://leetcode.com/problems/house-robber-iii/
//https://neetcode.io/problems/house-robber-iii?list=neetcode250
//https://www.youtube.com/watch?v=Nt0IqkcxG80
class HouseRobberIII {
    
    init() {
        
    }
    
//    Input: root = [3,2,3,null,3,null,1]
//    Output: 7
    func runTest() {
        
    }
    
    func rob(_ root: TreeNode?) -> Int {
        let options = robHelper(root)
        return max(options[0], options[1])
    }
    
    func robHelper(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [Int](repeating: 0, count: 2)
        }
        
        let leftChoices = robHelper(root.left)
        let rightChoices = robHelper(root.right)
        
        let rob = root.val + leftChoices[1] + rightChoices[1]
        let notRob = max(leftChoices[0], leftChoices[1]) + max(rightChoices[0], rightChoices[1])
        return [rob, notRob]
    }
}
