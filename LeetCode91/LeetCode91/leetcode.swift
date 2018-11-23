//
//  leetcode.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/9/27.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class leetcode: NSObject {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0{
            return 0
        }
        var sArr = [Character]()
        var indexCharDic  = [Character:Int]()
        var indexLengthDic  = [Int:Int]()
        var longest = 0
        
        for i in 0..<s.count{
            let index = s.index(s.startIndex, offsetBy: i)
            let char = s[index]
            if sArr.count > 0 && sArr.contains(char){
                let charIndex:Int = indexCharDic[char]!
                let lastCharLength = indexLengthDic[sArr.count - 1]
                if  sArr.count - 1 - lastCharLength! > charIndex{
                    indexLengthDic.updateValue(lastCharLength! + 1, forKey: sArr.count)
                }else{
                    indexLengthDic.updateValue(sArr.count - charIndex, forKey: sArr.count)
                }
            }
            if sArr.count > 0 && !sArr.contains(char){
                let lastCharLength = indexLengthDic[sArr.count - 1]
                indexLengthDic.updateValue(lastCharLength! + 1, forKey: sArr.count)
            }
            if sArr.count == 0{
                indexLengthDic.updateValue(1, forKey: 0)
            }
            sArr.append(char)
            indexCharDic.updateValue(sArr.count - 1, forKey: char)
            longest = longest > indexLengthDic[sArr.count - 1]! ? longest :indexLengthDic[sArr.count - 1]!
        }
        return longest
    }
}
