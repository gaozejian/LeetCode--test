//
//  leetcdoekmp.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/18.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcdoekmp: NSObject {
    func kmpbaoli(_ mainStr :String ,_ pStr :String) -> Bool {
        for i  in 0..<mainStr.count - pStr.count {
            for k in 0..<pStr.count{
                
                let index = mainStr.index(mainStr.startIndex, offsetBy: i+k)
                let str  = String.init(mainStr[index])
                
                let indexp = pStr.index(pStr.startIndex, offsetBy: k)
                let strp = String.init(pStr[indexp])
                if str != strp{
                    break
                }
                if k == pStr.count - 1{
                    return true
                }
                
            }
           
            
        }
        return false
    }
    
    //https://blog.csdn.net/x__1998/article/details/79951598
    func gethexLong(_ str :String) -> [Int] {
        var next :[Int] = []
        
        for i  in 0..<str.count {

            let strItme = str.getStringRangeStr(0, i)
            print(strItme)
            if(i == 0){
                next.append(0)
            }else{
                let lastLength = next[i - 1]
                let lastStr = strItme.getStringChar(strItme.count - 1)//最后字符
                let firstStr = strItme.getStringChar(0)//第一个字符
                if(lastStr == firstStr){
                   
                    next.append(lastLength + 1)
                }else{
                    let PfirstStr = strItme.getStringChar(0)//第一个字符
                    if(lastStr == PfirstStr){
                        next.append(1)
                    }else{
                        next.append(0)
                    }
                }
            }
        }
         print(next)
        return next
    }
    
    func kmp(_ mainStr :String ,_ pStr :String) -> Bool {
       
     let next = self.gethexLong(pStr)
        var j = 0
        var count = 0 //一共可以匹配的字符串个数
        for i  in 0..<mainStr.count{
            
            let str  = mainStr.getStringChar(i)
            let strp = pStr.getStringChar(j)
            
            if str != strp{
                let lastCount = next[j]
                j = lastCount
            }else{
                if j == pStr.count - 1{
                    count += 1
                    return true
                    j = 0
                }else{
                    j += 1
                }
               
            }
        }
        return false
    }
}
