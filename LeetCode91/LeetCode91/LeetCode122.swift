//
//  LeetCode122.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/9/28.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class LeetCode122: NSObject {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxMoney = 0
        var allMoney = 0
        if prices.count == 0{
            return 0
        }
        
        for i  in 1..<prices.count {
          maxMoney = prices[i] - prices[i - 1]
          maxMoney = max(0, maxMoney)
          allMoney = allMoney + maxMoney
        }
        return allMoney
    }
}
