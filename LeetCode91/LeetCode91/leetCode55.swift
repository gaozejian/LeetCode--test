//
//  leetCode55.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/10/12.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class leetCode55: NSObject {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count <= 0{
            return false
        }
        if nums.count == 1 {
            return true
        }
        var itmeSta = nums.count - 1
        
        for i in 0..<nums.count - 1 {
            let lastSta = nums.count - 2 - i
            if nums[lastSta] + lastSta < itmeSta{
                if lastSta == 0{
                    return false
                }
                continue
            }else{
                if lastSta == 0{
                    return true
                }
                itmeSta = lastSta
            }
        }
     return false
    }
}
