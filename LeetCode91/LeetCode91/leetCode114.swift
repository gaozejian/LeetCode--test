//
//  leetCode114.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/10/15.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class leetCode114: NSObject {
    func flatten(_ root: TreeNode?) {
        if root == nil{
            return
        }else{
            flatten(root?.left)
            flatten(root?.right)
            if ((root?.left) != nil) {
                var newNode = root?.right
                root?.right = root?.left
                root?.left = nil
                if (newNode != nil){
                    var rTree = root
                    
                    while (rTree?.right != nil){
                        rTree = rTree?.right
                    }
                    rTree?.right = newNode
                }
                
            }
        }
    }
    func flatten1( _ root: TreeNode?) {
        if !(root != nil){
            return
        }
        var rightArr = [TreeNode]()
        var newTree: TreeNode = root!
        var run:Bool = true
        repeat{
            while newTree.left != nil || newTree.right != nil {
                if newTree.right != nil{
                    rightArr.append((newTree.right!))
                    newTree.right = nil
                }
                if newTree.left != nil{
                    newTree.right = newTree.left
                    let temp = newTree.left
                    newTree.left = nil
                    newTree = temp!
                    
                }
            }
            if(rightArr.count > 0){
                newTree.right = rightArr.last!
                newTree = rightArr.last!
                rightArr.remove(at: rightArr.count - 1)
            }else{
                run = false
            }
        }while run
        
        
    }
}
public class TreeNode {
    public var val: Int
    public var bf: Int = 0
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
