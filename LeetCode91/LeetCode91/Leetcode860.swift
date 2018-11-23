//
//  Leetcode860.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/9/28.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class Leetcode860: NSObject {
    func lemonadeChange(_ bills: [Int]) -> Bool {
       
        var dic = [Int:Int]()
        dic.updateValue(0, forKey: 5)
        dic.updateValue(0, forKey: 10)
        dic.updateValue(0, forKey: 20)
        for i  in 0..<bills.count {
            if bills[i] - 5 == 0{
                dic.updateValue(dic[5]! + 1, forKey: 5)
                continue
            }
            let dif = bills[i] - 5
            let tenCount =  dif/10
            let fiveCount =  dif/5
            let sfiveCount =  fiveCount - tenCount * 2
            var needFive: Int = 0
            
            if dic[10]! - tenCount < 0{
                 needFive = (tenCount - dic[10]!) * 2
            }
            if dic[5]! < needFive  + sfiveCount{
                return false
            }else{
               dic.updateValue(max(0, dic[5]! - needFive - sfiveCount), forKey: 5)
            }
            dic.updateValue(max(0, dic[10]! - tenCount), forKey: 10)
            dic.updateValue(dic[bills[i]]!  + 1, forKey: bills[i])
        }
       return true
    }
}
