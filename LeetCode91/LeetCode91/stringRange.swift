//
//  stringRange.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/19.
//  Copyright © 2018 solordreams. All rights reserved.
//

import Foundation

protocol stringRangeProtocol {
    
    func getStringChar(_ index:Int) -> String
    func getStringRangeStr(_ Startindex:Int , _ length :Int) -> String
}
extension String: stringRangeProtocol{
    func getStringChar(_ index:Int) -> String{

        let firstIndex = self.index(self.startIndex, offsetBy: index)
        let firstStr = self[firstIndex]
        return String(firstStr)
    }
    func getStringRangeStr(_ Startindex:Int , _ end :Int) -> String{
        let index0 = self.index(self.startIndex, offsetBy: Startindex)
        let index1 = self.index(self.startIndex, offsetBy:  end)
        let strItme = self[index0...index1]
        return String(strItme)
    }
    
}
