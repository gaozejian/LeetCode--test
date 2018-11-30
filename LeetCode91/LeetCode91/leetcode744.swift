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
       // return self.kuaipai(letter: arr)
       return self.kuaipai(letter: arr, beginIndex: 1, lastIndex: arr.count - 1, middIndex: 0)
      
    }
    func kuaipai(letter: [Int],beginIndex: Int,lastIndex: Int,middIndex: Int) -> [Int] {
        //[3,4,6,2,5,1]
        
        if letter.count <= 0{
            return []
        }
        
        var startIndex :Int = beginIndex < letter.count ? beginIndex : letter.count - 1;
        var endIndex:Int = lastIndex < letter.count ? lastIndex : startIndex;
        let centerIndex:Int = middIndex < letter.count ? middIndex : startIndex;
        var arr:[Int] = letter
        let center:Int = letter[centerIndex]
        if(startIndex >= endIndex){
            if arr[centerIndex] > arr[startIndex]{
                arr.swapAt(centerIndex, startIndex)
            }
            return arr
        }
        while startIndex < endIndex {
            while arr[endIndex] > center && endIndex > startIndex{
                endIndex  = endIndex - 1
            }
            while arr[startIndex] < center && endIndex > startIndex{
                startIndex = startIndex + 1
            }
                arr.swapAt(startIndex, endIndex)
            if endIndex > startIndex{
                startIndex = startIndex + 1
                endIndex  = endIndex - 1
            }
        }
        if endIndex < startIndex{
            swap(&endIndex, &startIndex)
        }
        if center < arr[startIndex] {
            startIndex = startIndex - 1
            endIndex = endIndex - 1
        }
        arr.swapAt(centerIndex , startIndex)
        arr =    self.kuaipai(letter: arr, beginIndex: beginIndex, lastIndex: startIndex, middIndex: beginIndex - 1)
        
        arr =    self.kuaipai(letter: arr, beginIndex: endIndex + 2, lastIndex: letter.count - 1, middIndex: endIndex + 1)
        
        return arr
    }
    
   
    
}
