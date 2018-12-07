//
//  leetcodequickiy.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/3.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class leetcodequickiy: NSObject {
    func paixu(_ letter: [Int]) -> [Int] {
        var arr:[Int] = letter
        // return self.kuaipai(letter: arr)
        return self.kuaipai(letter: arr, beginIndex: 1, lastIndex: arr.count - 1, middIndex: 0)
        
    }
    func kuaipai(letter: [Int],beginIndex: Int,lastIndex: Int,middIndex: Int) -> [Int] {
        
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
            return arr//递归的结束的边界
        }
        while startIndex < endIndex {
            while arr[endIndex] > center && endIndex > startIndex{
                endIndex  = endIndex - 1
            }//end - start 次
            while arr[startIndex] < center && endIndex > startIndex{
                startIndex = startIndex + 1
            }//end - start 次
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
        arr =  self.kuaipai(letter: arr, beginIndex: beginIndex, lastIndex: startIndex, middIndex: beginIndex - 1)
        
        arr =  self.kuaipai(letter: arr, beginIndex: endIndex + 2, lastIndex: letter.count - 1, middIndex: endIndex + 1)
        
        return arr
    }
    
    /*
     n^2 + (n/2)^2 + (n/4)^2 + (n/8)^2  + (n/16)^2
     
     n-1 n-2 n-3
     n/2 + n/4 + n/8......1
     */
    
    /*
     https://blog.csdn.net/not_in_mountain/article/details/77976743
     时间复杂度
     快速排序涉及到递归调用，所以该算法的时间复杂度还需要从递归算法的复杂度开始说起；
     递归算法的时间复杂度公式：T[n] = aT[n/b] + f(n)  ；对于递归算法的时间复杂度这里就不展开来说了；
     
     最优情况下时间复杂度
     快速排序最优的情况就是每一次取到的元素都刚好平分整个数组(很显然我上面的不是)；
     此时的时间复杂度公式则为：T[n] = 2T[n/2] + f(n)；T[n/2]为平分后的子数组的时间复杂度，f[n] 为平分这个数组时所花的时间；
     下面来推算下，在最优的情况下快速排序时间复杂度的计算(用迭代法)：
     T[n] =  2T[n/2] + n                                                                     ----------------第一次递归
     令：n = n/2        =  2 { 2 T[n/4] + (n/2) }  + n                                               ----------------第二次递归
     
     =  2^2 T[ n/ (2^2) ] + 2n
     
     令：n = n/(2^2)   =  2^2  {  2 T[n/ (2^3) ]  + n/(2^2)}  +  2n                         ----------------第三次递归
     
     =  2^3 T[  n/ (2^3) ]  + 3n
     
     ......................................................................................
     
     令：n = n/(  2^(m-1) )    =  2^m T[1]  + mn                                                  ----------------第m次递归(m次后结束)
     
     当最后平分的不能再平分时，也就是说把公式一直往下跌倒，到最后得到T[1]时，说明这个公式已经迭代完了（T[1]是常量了）。
     
     得到：T[n/ (2^m) ]  =  T[1]    ===>>   n = 2^m   ====>> m = logn；  (至此得到递归次数)
     
     T[n] = 2^m T[1] + mn ；其中m = logn;
     
     T[n] = 2^(logn) T[1] + nlogn  =  n T[1] + nlogn  =  n + nlogn  ；其中n为元素个数
     
     又因为当n >=  2时：nlogn  >=  n  (也就是logn > 1)，所以取后面的 nlogn；
     
     综上所述：快速排序最优的情况下时间复杂度为：O( nlogn )
     */
}
