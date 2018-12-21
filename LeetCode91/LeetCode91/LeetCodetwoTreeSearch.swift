//
//  LeetCodetwoTreeSearch.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/20.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class LeetCodetwoTreeSearch: NSObject {
    func createTree(_ arr:[Int]) -> TreeNode {
        print(arr)
        var tree = self.getNodelTree(arr[0])
        for i  in 1..<arr.count {
         tree = self.inserTree(tree, arr[i])
        }
       return tree
    }
    
    func inserTree(_ tree:TreeNode,_ root:Int) -> TreeNode {
        let rootT = tree
        if rootT.val >= root{
            if rootT.left != nil{
                let newNode = self.inserTree(rootT.left!, root)
                rootT.left = nil
                rootT.left = newNode
                return rootT
            }else{
                let newNode = self.getNodelTree(root)
                rootT.left = newNode
                return rootT
            }
        }else if rootT.val < root{
            if rootT.right != nil{
                let newNode = self.inserTree(rootT.right!, root)
                rootT.right = nil
                rootT.right = newNode
                return rootT
            }else{
                let newNode = self.getNodelTree(root)
                rootT.right = newNode
                return rootT
            }
        }
        return rootT
    }
    
    
    func nodeTreeSearche(_ key:Int , _ arr:[Int]) -> Bool {
        var tree = self.createTree(arr)
        while true { 
            
            let value = tree.val
            if value > key {
                if tree.left != nil{
                    tree = tree.left!
                }else{
                    break
                }
                
            }else if value < key{
                if tree.right != nil{
                    tree = tree.right!
                }else{
                    break
                }
            }else{
                return true
            }
        }
        return false
    }
    
    
    func deleNodeTree(_ key : Int , _ arr : [Int]) -> TreeNode {
        var tree = self.createTree(arr)
        var treeT = tree
        if self.nodeTreeSearche(key, arr){
            print("不存在")
            return tree
        }
    
        while true {
            
            let value = tree.val
            if value > key {
                if tree.left != nil{
                    treeT = tree
                    tree = tree.left!
                }else{
                    break
                }
                
            }else if value < key{
                if tree.right != nil{
                    tree = tree.right!
                }else{
                    break
                }
            }else{
                if tree.left != nil{
                    
                }
            }
        }
        return tree
    }
    
    
    func getNodelTree(_ data:Int) -> TreeNode {
        let tree: TreeNode = TreeNode.init(data)
        tree.left = nil
        tree.right = nil
        return tree
    }
}
