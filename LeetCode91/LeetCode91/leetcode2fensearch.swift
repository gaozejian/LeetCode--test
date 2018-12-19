//
//  leetcode2fensearch.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/19.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcode2fensearch: NSObject {
    //[1,2,4,6,9,12,14,34]
    func twofen1(_ arr:[Int],_ key:Int, _ low:Int, _ height:Int) -> Bool {
        if low >= height{
            if arr[low] == key{
                return true
            }
            return false
        }
        let mid = (low + height)/2   // let mid = (height - low)/2 + low
        if arr[mid] < key{
             return   self.twofen(arr, key, mid + 1, height)
        }else if arr[mid] > key{
             return self.twofen(arr, key, low, mid - 1)
        }else{
            print(mid)
            return true
        }
        
    }
    
    func twofen2(_ arr:[Int],_ key:Int, _ low:Int, _ height:Int) -> Bool {
        if low >= height{
            if arr[low] == key{
                return true
            }
            return false
        }
        let mid = (height - low) * (key - arr[low]) / (arr[height] - arr[low])  + low     //均匀分布的
        if arr[mid] < key{
            return   self.twofen(arr, key, mid + 1, height)
        }else if arr[mid] > key{
            return self.twofen(arr, key, low, mid - 1)
        }else{
            print(mid)
            return true
        }
        
    }
    /*
     与拆半查找一样，也是logn。不少博客说，在处理海量数据时，拆分查找的middle = (low + hight)/2，
     除法可能会影响效率，而斐波那契的middle = low + F[k-1] -1，纯加减计算，速度要快一些。
     我觉得是扯淡，因为完全可以用middle = (loe+hight)>>2来代替，要知道相比于加减乘除而言，
     位运算的效率可是最高的哟。
    
     */
    
    func makeFBArr(_ arrCount:Int) -> [Int] {
        var i  = 1
        var arrFB :[Int] = [0]
        
        while i < arrCount {
            if i == 1{
                arrFB.append( arrFB[0] + 1)
            }else{
                arrFB.append(arrFB[i - 1] + arrFB[i - 2])
            }
            i += 1
        }
        return arrFB
    }
    
    func twofen(_ arr1:[Int],_ key:Int, _ low:Int, _ height:Int) -> Bool {
        var arr = arr1
        var Low = low
       // var Height = height
        
        
        let fpArr = self.makeFBArr(height - low + 1)
       // print(fpArr)
        var k = 0
        while arr.count > fpArr[k] {
            k += 1
        }
        for _ in arr.count..<fpArr[k] {
            arr.append(arr1[arr1.count - 1])
        }
        while Low <= height {
            let mid = fpArr[k - 1] - 1 + Low
            if arr[mid] > key{
                k = k - 1
            }else if arr[mid] < key{
                Low = mid + 1
                k = k - 2
            }else{
                return true
            }
            
        }
        return false
    }
}
