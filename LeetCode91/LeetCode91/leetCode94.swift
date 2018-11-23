//
//  leetCode94.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/10/16.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit
/*
          1
         / \
        2   5
       / \   \
      3   4   6  324156
 */
class leetCode94: NSObject {
    
//    var tree1 = TreeNode.init(1)
//    var tree2 = TreeNode.init(2)
//    var tree5 = TreeNode.init(5)
//    tree2.left = TreeNode.init(3)
//    tree2.right = TreeNode.init(4)
//    tree5.right = TreeNode.init(6)
//    tree1.left = tree2
//    tree1.right = tree5
    //中序遍历
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        
        if root == nil {
            return []
        }else{
            arr.append(contentsOf: inorderTraversal(root?.left))
            arr.append((root?.val)!)
            arr.append(contentsOf: inorderTraversal(root?.right))

        }
      return arr
    }
    
    func inorderTraversalWhile(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        var treeNodeRright = [TreeNode]()
        var rootL = root
        while treeNodeRright.count > 0 || rootL != nil{
            while rootL?.left != nil || rootL != nil{
                let newRight = rootL
                if rootL?.left != nil{
                    rootL = rootL?.left
                }else{
                    rootL = nil
                }
                newRight?.left = nil
                treeNodeRright.append(newRight!)
            }
            if treeNodeRright.count > 0{
                rootL = treeNodeRright.last!
                treeNodeRright.remove(at: treeNodeRright.count - 1)
                while rootL?.left == nil{
                    arr.append((rootL?.val)!)
                    if ((rootL?.right) != nil){
                        rootL = rootL?.right
                    }else{
                        if treeNodeRright.count > 0{
                            rootL = treeNodeRright.last!
                            treeNodeRright.remove(at: treeNodeRright.count - 1)
                        }else{
                            rootL = nil
                            break
                        }
                    }
                }
            }else{
                rootL = nil
            }
            
        }
   
        return arr
    }
    func inorderTraversalWhile2(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        var treeNodeRright = [TreeNode]()
        var rootL = root
        while treeNodeRright.count > 0 || rootL != nil{
            while rootL?.left != nil || rootL != nil{
                let newRight = rootL
                if rootL?.left != nil{
                    rootL = rootL?.left
                }else{
                    rootL = nil
                }
                newRight?.left = nil
                treeNodeRright.append(newRight!)
            }
            while rootL?.right != nil || rootL != nil{
                let newRight = rootL
                if rootL?.left != nil{
                    rootL = rootL?.left
                }else{
                    rootL = nil
                }
                newRight?.left = nil
                treeNodeRright.append(newRight!)
            }
           
            
        }
        
        return arr
    }
    //前序遍历  前序遍历的规则：
    /*
      1
     / \
    2   5
   / \   \
  3   4   6
     */
    //（1）访问根节点
    
   // （2）前序遍历左子树
    
   // （3）前序遍历右子树 123456
    func inorderTraversalforgate(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        
        if root == nil {
            return []
        }else{
            arr.append((root?.val)!)
            arr.append(contentsOf: inorderTraversalforgate(root?.left))
            arr.append(contentsOf: inorderTraversalforgate(root?.right))
            
        }
        return arr
    }
    
    func inorderTraversalforgateWhile(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        var treeNodeRright = [TreeNode]()
        var rootL = root
        while treeNodeRright.count > 0 || rootL != nil{
            while rootL?.left != nil || rootL?.right != nil{
                
                if rootL?.right != nil{
                    let newRight = rootL?.right
                    treeNodeRright.append(newRight!)
                }
                if rootL?.left != nil{
                    arr.append((rootL?.val)!)
                    rootL = rootL?.left!
                }else{
                    break
                }
            }
            arr.append((rootL?.val)!)
            if treeNodeRright.count > 0{
                rootL = treeNodeRright.last!
                treeNodeRright.remove(at: treeNodeRright.count - 1)
            }else{
                rootL = nil;
            }
        }
        return arr
    }

//    （1）后序遍历左子树
//    （2）后序遍历右子树
//    （3）访问根结点   342651
    func inorderTraversallate(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        
        if root == nil {
            return []
        }else{
            arr.append(contentsOf: inorderTraversallate(root?.left))
            arr.append(contentsOf: inorderTraversallate(root?.right))
            arr.append((root?.val)!)
        }
        return arr
    }
    /*
         1
        / \
       2   5
      / \   \
     3   4   6
     */
    func inorderTraversallatewhile(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        var arrRootNodeR = [TreeNode]()
        var rootL  = root
        
        while arrRootNodeR.count > 0 || rootL != nil {
            while rootL?.left != nil || rootL?.right != nil{
                let nodeRight :TreeNode = rootL!
                if rootL?.left != nil{
                    rootL = rootL?.left!
                    nodeRight.left = nil
                }else{
                    if(rootL?.right != nil){
                        rootL = rootL?.right!
                        nodeRight.right = nil
                        nodeRight.left = nil
                    }
                }
                
                arrRootNodeR.append(nodeRight)
            }
            arr.append((rootL?.val)!)
            if  arrRootNodeR.count > 0{
                rootL = arrRootNodeR.last!
                arrRootNodeR.remove(at: arrRootNodeR.count - 1)
            }else{
                rootL = nil
            }
            
        }
        
        return arr
    }
}

