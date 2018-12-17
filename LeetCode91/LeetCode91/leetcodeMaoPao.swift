//
//  leetcodeMaoPao.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/14.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcodeMaoPao: NSObject {
    func paixump(_ arr:[Int]) -> [Int] {
        print(arr)
        var newArr = arr
        
        for _  in 0..<arr.count {
            for k in 0..<arr.count - 1{
                if newArr[k] > newArr[k + 1]{
                    newArr.swapAt(k, k+1)
                }
            }
        }
        
        return newArr
    }
    //https://blog.csdn.net/hansionz/article/details/80822494    优化
    func paixu1(_ arr:[Int]) -> [Int] {
        print(arr)
        var newArr = arr
        for i  in 0..<arr.count {
            for k in 0..<arr.count - 1 - i{
                if newArr[k] > newArr[k + 1]{
                    newArr.swapAt(k, k+1)
                }
            }
        }
        
        return newArr
    }
    func paixu(_ arr:[Int]) -> [Int] {
        print(arr)
        var newArr = arr
        for i  in 0..<arr.count {
            var flag = false
            for k in 0..<arr.count - 1 - i{
                if newArr[k] > newArr[k + 1]{
                    newArr.swapAt(k, k+1)
                    flag = true
                }
            }
        }
        
        return newArr
    }
}
