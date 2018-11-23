//
//  LeetCode2.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/9/28.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class LeetCode2: NSObject {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var start = 0
        var sumGas = 0
        var temp = 0
        for i in 0..<gas.count {
            sumGas = gas[i] - cost[i] + sumGas
            if sumGas < 0{
                start = i + 1
                temp = sumGas + temp
                sumGas = 0
                continue
            }
        }
        if (sumGas + temp) >= 0{
            return start
        }else{
            return -1
        }
    }
}
