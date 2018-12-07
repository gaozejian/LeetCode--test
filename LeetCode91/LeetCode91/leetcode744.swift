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

    func paixu(_ letter: [Int]) -> [Int] {
        var arr:[Int] = letter
        print(letter)
       return self.guibing(arr, 2)
    }
   
    func guibing(_ letter:[Int],_ length:Int) -> [Int] {
       
        var arr:[Int] = letter
        var inserIndexArr:[Int] = []
        for i in 0..<letter.count {
            var v = i/length * length + length/2
            if length > arr.count{
                v = length/2
            }
            if i >= v {
                
                var startIndex = i/length * length < 0 ? 0 : i/length * length
                while arr[i] >= arr[startIndex] && startIndex < v{
                    startIndex += 1
                }
                inserIndexArr.append(startIndex)
              
            }
            if (i == (i + 1)/length * length - 1  && (i + 1)/length > 0) || i == arr.count - 1 {
                    for j in 0..<inserIndexArr.count{
                        let inser = arr[i - inserIndexArr.count + 1 + j]
                        arr.remove(at:i - inserIndexArr.count + 1 + j)
                        arr.insert(inser, at:  inserIndexArr[j]  + j)
                    }
                inserIndexArr.removeAll()
            }
            
        }
        if length > letter.count {
            return arr
        }
         arr = self.guibing(arr, 2 * length )
        return arr
    }
   
}
