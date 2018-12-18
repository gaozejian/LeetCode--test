//
//  leetcodeMaoPao.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/14.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcodeMaoPao: NSObject {
    
    func getArr10000(_ length:Int) -> [Int] {
        var arr1W :[Int] = []
      
        while arr1W.count < length {
            let num :Int = Int(arc4random()%uint(length))
            if arr1W.contains(num){
                continue
            }
            arr1W.append(num)
        }
//        let filePath:String = NSHomeDirectory() + "/Documents/tf.plist"
//        arr1W.writeToFile(filePath, atomically: true)
        
       // tfArray = NSArray(contentsOfFile:NSHomeDirectory() + "/Documents/tf.plist")
        return arr1W
    }
    
    func paixu0(_ arr:[Int]) -> [Int] {
        //print(arr)
        var newArr = arr
        
        for _  in 0..<arr.count {
            for k in 0..<arr.count - 1{
                if newArr[k] > newArr[k + 1]{
                    newArr.swapAt(k, k+1)
                }
            }
        }
        
        return []
    }
    //https://blog.csdn.net/hansionz/article/details/80822494    优化
    func paixu1(_ arr:[Int]) -> [Int] {
       // print(arr)
        let startTime = CFAbsoluteTimeGetCurrent()
        
        var newArr = arr
        for i  in 0..<arr.count {
            for k in 0..<arr.count - 1 - i{
                if newArr[k] > newArr[k + 1]{
                    newArr.swapAt(k, k+1)
                }
            }
        }
       let endTime = CFAbsoluteTimeGetCurrent()
        print("代码1执行时长：%f 秒", (endTime - startTime))
        return []
    }
    //优化一
    func paixu2(_ arr:[Int]) -> [Int] {
        //print(arr)
        let startTime = CFAbsoluteTimeGetCurrent()
        var newArr = arr
        for i  in 0..<arr.count {
            var flag = false
            for k in 0..<arr.count - 1 - i{
                if newArr[k] > newArr[k + 1]{
                    newArr.swapAt(k, k+1)
                    flag = true
                }
                if flag == false{
                    let endTime = CFAbsoluteTimeGetCurrent()
                    print("代码2执行时长：%f 秒", (endTime - startTime))
                    return []
                }
            }
        }
        
        let endTime = CFAbsoluteTimeGetCurrent()
        print("代码2执行时长：%f 秒", (endTime - startTime))
        return []
    }
    
    //优化2
    func paixu3(_ arr:[Int]) -> [Int] {
       // print(arr)
         let startTime = CFAbsoluteTimeGetCurrent()
        var newArr = arr
        var lastBounce = arr.count - 1
        for i  in 0..<arr.count {
            
            for k in 0..<lastBounce{
                if newArr[k] > newArr[k + 1]{
                    newArr.swapAt(k, k+1)
                    lastBounce = k
                }
            }
        }
        
        let endTime = CFAbsoluteTimeGetCurrent()
        print("代码3执行时长：%f 秒", (endTime - startTime))
        return []
    }
    
    //优化3  两遍同事生成
    func paixu4(_ arr:[Int]) -> [Int] {

        let startTime = CFAbsoluteTimeGetCurrent()
        var newArr = arr

        for i  in 0..<arr.count {
            
            for k in 0..<arr.count - 1 - i{
                if newArr[k] > newArr[k + 1]{
                    newArr.swapAt(k, k+1)
                }
            }
            for k in ((i+1)..<arr.count).reversed(){
                if newArr[k] < newArr[k - 1]{
                    newArr.swapAt(k, k-1)
                }
            }
        }
        
        let endTime = CFAbsoluteTimeGetCurrent()
        print("代码4执行时长：%f 秒", (endTime - startTime))
        return []
    }
    //https://blog.csdn.net/l21871035/article/details/9042089
//https://bbs.csdn.net/topics/390554511
}
