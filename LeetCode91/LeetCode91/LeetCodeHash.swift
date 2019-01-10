//
//  LeetCodeHash.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/20.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class LeetCodeHash: NSObject {
    private var elementArr:[String] = []
    private var HashArr:[[String]]
    private var length:Int
    init(_ capcity:Int) {
        length = capcity
        HashArr = Array<[String]>.init(repeating: [], count: capcity)
        
    }
    
    func indexForKey(_ key:String) -> Int {
         let index = key.count % length
       
        
         return index
    }
    
    func MyValueForKey(_ key:String,_ value:String)  {
        let index = self.indexForKey(key)
        var element = HashArr[index]
        element.append(value)
        HashArr.insert(element, at: index)
    }
    func myValueForKey(_ key:String) -> String {
        let index = self.indexForKey(key)
        let elementArr = HashArr[index]
        return elementArr[0]
    }
}
