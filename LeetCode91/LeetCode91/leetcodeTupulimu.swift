//
//  leetcodeTupulimu.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/26.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcodeTupulimu: NSObject {
    struct MinArrIndexValue {
        var Index = 0
        var value = 0
    }
//普利姆   https://blog.csdn.net/gluawwa/article/details/52299273
//    private let graphArr :[[Int]] = [[0,6,1,5,Int(MAXINTERP),Int(MAXINTERP)],
//                                     [6,0,5,Int(MAXINTERP),3,Int(MAXINTERP)],
//                                     [1,5,0,5,6,4],
//                                     [5,Int(MAXINTERP),5,0,Int(MAXINTERP),2],
//                                     [Int(MAXFLOAT),3,6,Int(MAXFLOAT),0,6],
//                                     [Int(MAXFLOAT),Int(MAXFLOAT),4,2,6,0]
//                                     ]
    func getMinlength(_ arr1:[[Int]]) -> [Int] {
        let arr :[[Int]] = [     [0,6,1,5,1024 ,1024],
                                 [6,0,5,1024,3,1024],
                                 [1,5,0,5,6,4],
                                 [5,1024,5,0,1024,2],
                                 [1024,3,6,1024,0,6],
                                 [1024,1024,4,2,6,0]
        ]
        var MinLength:[Int] = []
        var vistArr:[Int] = []
        vistArr.append(0)
        var nextArr = arr[0]
        while true {
            let minArrIndexValue = self.getArrMin(nextArr)
            MinLength.append(minArrIndexValue.value)
            if !vistArr.contains(minArrIndexValue.Index){
                vistArr.append(minArrIndexValue.Index)
                nextArr = self.getArrForm2Arr(arr[vistArr[vistArr.count - 1]], nextArr,vistArr)
            }else{
                break
            }
            
            
        }
    return vistArr
    }
    
    func getArrMin(_ arr:[Int]) -> MinArrIndexValue {
        var minValue:Int = 1024
        var minValueIndex = 0
        for i  in 0..<arr.count {
            
            let itme = arr[i]
            if itme == 0 || itme == 1024{
                continue
            }
            if itme < minValue{
                minValue = itme
                minValueIndex = i
            }
            
        }
        let KeyVa = MinArrIndexValue(Index: minValueIndex,value: minValue)
        return KeyVa
    }
    
    func getArrForm2Arr(_ arr1:[Int],_ arr2:[Int],_ vistArr:[Int]) -> [Int] {
        var result:[Int] = []
    
        for i  in 0..<arr1.count {
            if vistArr.contains(i){
                result.append(1024)
            }else{
                result.append(min(arr1[i], arr2[i]))
            }
        }
        return result
    }
}
