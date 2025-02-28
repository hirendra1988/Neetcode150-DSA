//
//  Video.swift
//  Neetcode150
//
//  Created by Hirendra Sharma on 27/02/25.
//
//https://www.youtube.com/watch?v=Yk3Jwm5YuFs&t=22s
//https://chatgpt.com/c/67c14493-eab8-8006-9a5d-451930d6b43a
//https://www.youtube.com/watch?v=XbjQ-heGd58
//🔥 Shortcut Method (Fast Trick)
//Just memorize these:
//
//Decimal    Binary
//2^0 = 1    0001
//2^1 = 2    0010
//2^2 = 4    0100
//2^3 = 8    1000
//2^4 = 16    10000
//2^5 = 32    100000

//Steps:
//Find the largest power of 2 less than 10
//✅ 8 → 2³
//
//Subtract 8 from 10
//10 - 8 = 2
//
//Next largest power of 2 is 2 → 2¹
//
//Subtract 2 - 2 = 0
//Now we're done!
//
//Now Write the Binary Number:
//2³(8)    2²(4)    2¹(2)    2⁰(1)
// 1         0        1        0
//
