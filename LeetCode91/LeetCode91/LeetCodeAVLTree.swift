//
//  LeetCodeAVLTree.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/12/24.
//  Copyright © 2018 solordreams. All rights reserved.
//

import UIKit

class LeetCodeAVLTree: NSObject {
    func createTree(_ arr:[Int]) -> TreeNode {
        print(arr)
        var tree = self.getNodelTree(arr[0])
        tree.bf = 0
        for i  in 1..<arr.count {
            tree = self.inserTree(tree, arr[i])
        }
        return tree
    }
    //https://blog.csdn.net/qq_24336773/article/details/81712866
    func inserTree(_ tree:TreeNode,_ root:Int) -> TreeNode {
        let rootT = tree
        if rootT.val >= root{
            if rootT.left != nil{
                rootT.bf += 1
                let newNode = self.inserTree(rootT.left!, root)
                rootT.left = nil
                rootT.left = newNode
                if rootT.bf > 1{
                    return self.LL_xuanzhuan(rootT)
                }
                return rootT
            }else{
                let newNode = self.getNodelTree(root)
                rootT.bf = rootT.bf + 1 //左边就是 + 1
                rootT.left = newNode
                if rootT.bf > 1{
                    return self.LL_xuanzhuan(rootT)
                }
                return rootT
            }
        }else if rootT.val < root{
            if rootT.right != nil{
                rootT.bf -= 1
                let newNode = self.inserTree(rootT.right!, root)
                rootT.right = nil
                rootT.right = newNode
                return rootT
            }else{
                let newNode = self.getNodelTree(root)
                rootT.bf = rootT.bf - 1  //右边就是 - 1
                rootT.right = newNode
                return rootT
            }
        }
        return rootT
    }
    func LL_xuanzhuan(_ tree:TreeNode) -> TreeNode {
        let L  = tree.left
        tree.left = nil
        tree.bf = 0
        L?.right = tree
        return L!
    }
    func R_xuanzhuan(_ tree:TreeNode) -> TreeNode {
        let L  = tree.left
        tree.left = L?.right
        L?.right = tree
        return L!
    }
    func leftBalance(_ tree:TreeNode) -> TreeNode {
        let L:TreeNode
        let LR:TreeNode
        L = tree.left!
        if L.bf > 0 {//左高
           tree.bf = 0
           L.bf = 0
           return self.R_xuanzhuan(L)
        }else if L.bf < 0{ //右边高
            LR = L.right!
            if LR.bf > 0{
                tree.bf = -1
                L.bf = 0
            }else if LR.bf < 0{
                tree.bf = 0
                L.bf = 1
            }else{
                tree.bf = 0
                L.bf = 0
            }
        }
       // LR!.bf = 0
        
        
        return tree
    }
    func getNodelTree(_ data:Int) -> TreeNode {
        let tree: TreeNode = TreeNode.init(data)
        tree.bf = 0
        tree.left = nil
        tree.right = nil
        return tree
    }
}
