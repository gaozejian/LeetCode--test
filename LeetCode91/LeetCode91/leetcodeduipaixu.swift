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
        //print(letter)
        let startTime = CFAbsoluteTimeGetCurrent()

        var arr:[Int] = letter
        for k  in (0...((letter.count-1)/2)).reversed() {
            
            arr = self.getBigDui(arr, k, letter.count - 1)
        }
        for k  in (0...letter.count - 1).reversed() {
            
            arr.swapAt(0, k)
            arr = self.getBigDui(arr, 0,k-1)
        }
        let endTime = CFAbsoluteTimeGetCurrent()
        print("代码dui执行时长：%f 秒", (endTime - startTime))
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
    
    /*
     时间复杂度
     构建大根堆 从最后一个非子节点开始遍历,向下递归为1层,这一层个数为 2^n
           1      向下遍历3层  个数为2^(0)
          / \
         2   3   向下遍历2层  个数为2^(i - 1)
        / \ / \
       4  5 6  7  向下遍历一层  个数为2^i
      /\ /\ /\ /\
      8 9 46 7 4 8
     
     假设 总共 为 k 层  i 为当前层
     则每个节点向下遍历层数为 k - i   当前层次数为 2^i
     2^i*(k - i)
     time = 2^(k - 2) * 1 + 2^(k-3)*2 +..... 2^1*(k - 2) + 2^0*(k - 1)
     元素个数为 n  这 k = logn
     带入上面  time = 2^(logn - 2) * 1 + 2^(logn-3)*2 +..... 2^1*(logn - 2) + 2^0*(logn - 1)
                   = n/(2^2) + n/(2^3) *2 + n/(2^4)*3 + ....+ 2*(logn - 2) + 1*(logn - 1)
     等式有logn - 1 项
     统一分母  1* n * 2^(logn - 1 - 2)     2*n * 2^(logn - 1 - 3)      3* n * 2^(logn - 1 - 4)
             ---------------------  +   ---------------------    +       --------------------- .........
                  2^(logn - 1)               2^(logn - 1)                  2^(logn - 1)
     
            分子  (1*n^2)/2^3 + (2*n^2)/2^4 + (3*n^2)/2^5 +........
                ---------------------------------------
                               n/2
     分子归纳为: n^2 *(常数)
     ----------------------
               n/2
     去除常数 为n     为O(n)
     
     
     S = 2^(k-2) * 1 + 2^(k-3)2…..+2(k-2)+2^(0)*(k-1) ===> 因为叶子层不用交换，所以i从 k-1 开始到 1；
     　　　　S = 2^k -k -1；又因为k为完全二叉树的深度，而log(n) =k，把此式带入；这一步没看懂
     　　　　得到：S = n - log(n) -1，所以时间复杂度为：O(n)
     ---------------------
     作者：CavalryOuO
     来源：CSDN
     原文：https://blog.csdn.net/qq_34228570/article/details/80024306
     版权声明：本文为博主原创文章，转载请附上博文链接！
     
     */
    
    /*调整大根堆
     外层 为 n  里面 为logn  O(nlogn)
     */
    
    
}
