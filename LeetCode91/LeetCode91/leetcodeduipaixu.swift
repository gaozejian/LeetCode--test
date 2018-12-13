//
//  leetcodeduipaixu.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/11/29.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcodeduipaixu: NSObject {
    func duipaixu2(_ letter: [Int]) -> [Int] {
        var arr:[Int] = letter
        for k  in (0...letter.count - 1).reversed() {
            
            arr = self.getBigDui2(arr, k)
            arr.swapAt(0, k)
            
        }
        
        return arr
    }
    
    func getBigDui2(_ letter: [Int] ,_ countLength:Int) -> [Int] {
        var letters = letter
        //   [100,55,65,44,22,32,12,45,67,88,12,34,21,34,56,78]
        for i in (0...countLength/2).reversed() {
            let rightIndex = i * 2 + 2
            let leftIdenx = i*2 + 1
            var root = letters[i]
            
            if rightIndex <= countLength{
                var right = letters[rightIndex]
                if root < right{
                    swap(&root, &right)
                }
                letters[rightIndex] = right
            }
            if leftIdenx <= countLength{
                var left = letters[leftIdenx]
                if root < left{
                    swap(&root, &left)
                }
                letters[leftIdenx] = left
                letters[i] = root
            }
        }
        return letters
        
    }
    /*
     https://blog.csdn.net/yuzhihui_no1/article/details/44258297
     时间复杂度计算 O(nlogn)
     0 1 2 3 4 5 6 7...
     0 0 1 1 2 2 3 3...
     (1 + 2 + 3 + 4 + .... n/2)*2
     ( 1+ n/2)/2 * n/2 * 2
     (2+n)/4 * n = n^2 + 2n  == O(n^2)
     */
    
    
    func duipaixu(_ letter: [Int]) -> [Int] {
        print(letter)
        var arr:[Int] = letter
        for k  in (0...((letter.count-1)/2)).reversed() {
            arr = self.getBigDui(arr, k, letter.count - 1)
        
        }
        for k  in (0...letter.count - 1).reversed() {
            arr.swapAt(0, k)
            arr = self.getBigDui(arr, 0,k-1)
        }
        return arr
    }
    
    func getBigDui(_ letter: [Int] ,_ i:Int ,_ countLength:Int) -> [Int] {
        var letters = letter
            let rightIndex = i * 2 + 2
            let leftIdenx = i*2 + 1
        if leftIdenx > countLength {
            return letters
        }
        var max :Int = leftIdenx
        if rightIndex <= countLength {
        
            let right = letters[rightIndex]
            let left = letters[leftIdenx]
            max = right > left ? rightIndex :leftIdenx
        }
        if letters[i] < letters[max]{
            letters.swapAt(i, max)
            letters = self.getBigDui(letters, max, countLength)
        }
        return letters
    }
}
