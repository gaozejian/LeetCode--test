//
//  leetcode744.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/11/24.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcode744: NSObject {
    /*
     给定一个只包含小写字母的有序数组letters 和一个目标字母 target，寻找有序数组里面比目标字母大的最小字母。
     
     数组里字母的顺序是循环的。举个例子，如果目标字母target = 'z' 并且有序数组为 letters = ['a', 'b']，则答案返回 'a'。
     
     示例:
     
     输入:
     letters = ["c", "f", "j"]
     target = "a"
     输出: "c"
     */
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        return "a"
    }
//    func getxulei(_ letters: [Character]) -> [Character] {
//        for i in (0...letters.count/2).reversed() {
//            <#code#>
//        }
//        return []
//    }
    func paixu(_ letter: [Int]) -> [Int] {
        var arr:[Int] = letter
        for k  in (0...letter.count - 1).reversed() {
            
            arr = self.getBigDui(arr, k)
            arr.swapAt(0, k)
            
        }
        return arr
    }
        
    
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
            var left = letters[leftIdenx]
           
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
