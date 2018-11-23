//
//  leetcode784.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/11/17.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcode784: NSObject {
    func letterCasePermutation(_ S: String) -> [String] {
        var result = [String]()//最后返回的数组
        result.append(S)
        for i in 0..<S.count{
            for k in 0..<result.count{
                let str :String = result[k]
                if str == ""{
                   continue
                }
                let resultStr:String = self.letterCasePermutation2(str, index: i)
                
                if (result.contains(resultStr) || resultStr == ""){
                    continue
                }
               result.append(resultStr)
            }
       
        }
      return result
    }
    
    func letterCasePermutation2(_ S: String  ,index: Int) -> String {
        
        for i in index..<S.count{
            
            let currentIndex = S.index(S.startIndex, offsetBy: i)
            let char :Character = S[currentIndex]
            if  "a" <= char && char <= "z"{
                var str:String = S
                let upString:String = String.init(char).uppercased()
                str.replaceSubrange( Range.init(NSRange.init(location: i, length: 1), in: str)!,with: repeatElement(upString[upString.index(upString.startIndex, offsetBy: 0)], count: 1))
                 return str
            }else if("A" <= char && char <= "Z"){
                var str:String = S
                let upString:String = String.init(char).lowercased()
                str.replaceSubrange( Range.init(NSRange.init(location: i, length: 1), in: str)!,with: repeatElement(upString[upString.index(upString.startIndex, offsetBy: 0)], count: 1))
                return str
            }
        }
      
        return ""
    }
}
