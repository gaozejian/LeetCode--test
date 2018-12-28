//
//  LeetCodeMostLessLength.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/28.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class LeetCodeMostLessLength: NSObject {
    struct MinArrIndexValue {
        var Index = 0
        var value = 0
    }
    //https://blog.csdn.net/qq_36523667/article/details/78779272    迪杰斯特拉算法
        private let graphArr :[[Int]] = [[0,6,3,1024,1024,1024],//A
                                         [6,0,2,5,1024,1024],   //B
                                         [3,2,0,3,4,1024],      //C
                                         [1024,6,3,0,2,3],      //D
                                         [1024,1024,4,2,0,5],   //E
                                         [1024,1024,1024,3,5,0], //F
                                         ]
    func getLessLengtnPonitToPoint(_ arr1 :[[Int]]) -> [[Int]] {
        
        var  arr :[[Int]] = [
                                [0,6,3,1024,1024,1024],//A
                                [6,0,2,5,1024,1024],   //B
                                [3,2,0,3,4,1024],      //C
                                [1024,6,3,0,2,3],      //D
                                [1024,1024,4,2,0,5],   //E
                                [1024,1024,1024,3,5,0], //F
                            ]
        
        var vists:[Int] = [0]
        var nextArr:[Int] = arr[0]
        var indexValue = MinArrIndexValue(Index: 0,value: 0)
        while true {
             indexValue = self.getArrMin(nextArr,indexValue.value)
            vists.append(indexValue.Index)
            for i in 0..<vists.count - 1{
                let newPointArr = self.updataLessLengthToEveryPoint(arr[vists[i]], arr[indexValue.Index], arr[vists[i]][indexValue.Index])
                arr[vists[i]] = newPointArr
            }
            nextArr = arr[indexValue.Index]
            //得到最后一个点到各点的最短距离
            if vists.count >= arr.count{
                nextArr.removeAll()
                for i in 0..<arr.count - 1{
                    nextArr.append(arr[i].last!)
                }
                nextArr.append(0)
                arr[arr.count - 1] = nextArr
                break
            }
        }
        
        return arr
    }
    
    func getArrMin(_ arr:[Int],_ vistlength:Int) -> MinArrIndexValue {
        var minValue:Int = 1024
        var minValueIndex = 0
        for i  in 0..<arr.count {
            
            let itme = arr[i]
            if itme == 0 || itme == 1024 || vistlength == itme{
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
    
    func updataLessLengthToEveryPoint(_ arr:[Int],_ nextArr:[Int],_ keylength:Int) -> [Int] {
        var newLengthArr:[Int] = []
        for i  in 0..<nextArr.count {
            if nextArr[i] == 1024{
                newLengthArr.append(1024)
            }else{
                newLengthArr.append(nextArr[i] + keylength)
            }
        }
        
        for i  in 0..<arr.count {
            newLengthArr[i] = min(newLengthArr[i], arr[i])
        }
        
        return newLengthArr
    }
}
