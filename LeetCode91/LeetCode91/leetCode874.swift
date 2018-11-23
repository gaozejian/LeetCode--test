//
//  leetCode874.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/9/28.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class leetCode874: NSObject {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var currentX = 0
        var currentY = 0
        var lastX = 0
        var lastY = 0
        var currentDir = 0
        var maxr = 0
        for i  in 0..<commands.count {
        
            if commands[i] == -1{
                currentDir += 90
            }else if commands[i] == -2{
                currentDir -= 90
            }else{
                lastX = currentX
                lastY = currentY
                switch currentDir%360 {
                    case 0:
                        currentY += commands[i]
                    break
                    case 90:
                        currentX += commands[i]
                    break
                    case 180:
                        currentY -= commands[i]
                    break
                    case 270:
                     currentX -= commands[i]
                    break
                    case -90:
                        currentX -= commands[i]
                    break
                    case -180:
                        currentY -= commands[i]
                    break
                default: break
                    
                }
                var addNum = 0
                while addNum < commands[i]{
                    
                      if  obstacles.contains(where: { (vad) -> Bool in
                            if vad.first == currentX && vad.last == currentY{
                               return true
                            }else{
                              return false
                        }
                      }){
                        
                        }
                addNum =  addNum + 1
                }
               
              
            }
            maxr =  max(maxr, currentX * currentX + currentY * currentY)
        }
       return maxr
    }
}
