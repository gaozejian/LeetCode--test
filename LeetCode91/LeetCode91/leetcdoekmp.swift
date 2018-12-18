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
            let index0 = str.index(str.startIndex, offsetBy: 0)
            let index1 = str.index(str.startIndex, offsetBy: i)
            let strItme = str[index0...index1]
            print(strItme)
            if(i == 0){
                next.append(0)
            }else{
                let lastLength = next[i - 1]
                
                let lastIndex = strItme.index(strItme.startIndex, offsetBy: strItme.count - 1)
                let lastStr = strItme[lastIndex]
                
                if lastLength == 0{
                    let firstIndex = strItme.index(strItme.startIndex, offsetBy: 0)
                    let firstStr = strItme[firstIndex]
                    if(lastStr == firstStr){
                        next.append(1)
                    }else{
                        next.append(0)
                    }
                }else{
                    let firstIndex = strItme.index(strItme.startIndex, offsetBy: lastLength)
                    let firstStr = strItme[firstIndex]
                    if(lastStr == firstStr){
                        next.append(next[i - 1] + 1)
                    }else{
                        let firstIndex = strItme.index(strItme.startIndex, offsetBy: 0)
                        let firstStr = strItme[firstIndex]
                        if(lastStr == firstStr){
                            next.append(1)
                        }else{
                            next.append(0)
                        }
                    }
                }
                
                
                
            }
            
            
            
        }
         print(next)
        return []
    }
    
    func kmp(_ mainStr :String ,_ pStr :String) -> Bool {
        self.gethexLong("abababca")
        return false
    }
}
