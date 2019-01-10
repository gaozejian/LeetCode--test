//
//  Leecode22.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/11/23.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class Leecode22: NSObject {
    /*
     给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
     
     例如，给出 n = 3，生成结果为：
     
     [
     "((()))",
     "(()())",
     "(())()",
     "()(())",
     "()()()"
     ]

     */
    func generateParenthesis(_ n: Int) -> [String] {
        var reuslt = [String]()
        var reusltDic = [String:Int]()
        let str :String = "("
        reuslt.append(str)
        let count = 1
        reusltDic[str] = count
        for i in 0..<(n*2 - 1){
            var teampReuslt = [String]()
            for k in 0..<reuslt.count{
                
                let currentStr = reuslt[k]
                if (reusltDic[currentStr] != nil){
                    if reusltDic[currentStr] == 0 {
                        let newStr = currentStr + "("
                        if !teampReuslt.contains(newStr){
                            teampReuslt.append(newStr)
                            reusltDic[newStr] = 1
                        }
                        if i == n * 2 - 2 && reusltDic[newStr] != 0{
                            teampReuslt.removeLast()
                        }
                    }else if reusltDic[currentStr]! < 0 || reusltDic[currentStr]! > n{
                       
                        continue
                    }else{
                        let newStr = currentStr + "("
                        if !teampReuslt.contains(newStr){
                            teampReuslt.append(newStr)
                            reusltDic[newStr] = reusltDic[currentStr]! + 1
                            if i == n * 2 - 2 && reusltDic[newStr] != 0{
                                teampReuslt.removeLast()
                            }
                        }
                        
                        let newStr2 = currentStr + ")"
                        if !teampReuslt.contains(newStr2){
                            teampReuslt.append(newStr2)
                            reusltDic[newStr2] = reusltDic[currentStr]! - 1
                            if reusltDic[newStr2]! < 0{
                                teampReuslt.removeLast()
                            }
                            if i == n * 2 - 2 && reusltDic[newStr2] != 0{
                                teampReuslt.removeLast()
                            }
                        }
                    }
                   
                    
                }
              
            }
            reuslt.removeAll()
            reuslt.append(contentsOf: teampReuslt)
          
        }
        
        
       return reuslt
    }
}
