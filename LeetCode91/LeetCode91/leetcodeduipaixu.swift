//
//  leetcodeduipaixu.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/11/29.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcodeduipaixu: NSObject {
    func duipaixu(_ letter: [Int]) -> [Int] {
        var arr:[Int] = letter
        for k  in (0...letter.count - 1).reversed() {
            
            arr = self.getBigDui(arr, k)
            arr.swapAt(0, k)
            
        }
        
        return arr
    }
    
    func getBigDui(_ letter: [Int] ,_ countLength:Int) -> [Int] {
        var letters = letter
        //   [100,55,65,44,22,32,12,45,67,88,12,34,21,34,56,78]
        for i in (0...countLength/2).reversed() {
            let rightIndex = i * 2 + 2
            let leftIdenx = i*2 + 1
            var root = letters[i]
            
            if rightIndex <= countLength{
                var right = letters[rightIndex]
                if root < right{
                    root = right + root
                    right = root - right
                    root = root - right
                }
                letters[rightIndex] = right
            }
            if leftIdenx <= countLength{
                var left = letters[leftIdenx]
                if root < left{
                    root = left + root
                    left = root - left
                    root = root - left
                }
                letters[leftIdenx] = left
                letters[i] = root
            }
        }
        return letters
        
    }
}
