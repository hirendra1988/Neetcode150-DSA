//
//  StringsDSA.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 05/12/24.
//

class StringsDSA {
    
    init() {
        runTest()
    }
    
    func runTest() {
        //let inputStr = "this-is a test_case"
        // output: thisIsATestCase
        let inputStr = "a b c d-e-f%g"
        // output: aBCDEFG
        let result = camelCaseDSAProblem(input: inputStr)
        print(result)
    }
    
    func camelCaseDSAProblem(input: String) -> String {
        var foundSpecialChar = false
        var result = ""
        
        for char in input {
            if char.isLetter {
                if foundSpecialChar {
                    result.append(char.uppercased())
                    foundSpecialChar = false
                } else {
                    result.append(char.lowercased())
                }
            } else {
                foundSpecialChar = true
            }
        }
        
        return result
    }
    
}
