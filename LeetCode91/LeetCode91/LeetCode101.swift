//
//  LeetCode101.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/11/2.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class LeetCode101: NSObject {
    /*
     例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
     
             1
            / \
            2   2
           / \ / \
          3  4 4  3
     */
//    var tree1 = TreeNode.init(1)
//    var tree2 = TreeNode.init(2)
//    var tree3 = TreeNode.init(2)
//    tree2.left = TreeNode.init(3)
//    tree2.right = TreeNode.init(4)
//    tree3.left = TreeNode.init(4)
//    tree3.right = TreeNode.init(3)
//    tree1.left = tree2
//    tree1.right = tree3
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil{
            return false
        } else{
            if root?.left != nil && root?.right != nil{
               // return self.treeNodeEqule(root?.left, root?.right)
                 return false
            }
            return false
        }
    }
//    func treeNodeEqule(_ rootLeft: TreeNode?,_ rootRight: TreeNode?) -> Bool {
//        if rootRight?.right == rootLeft?.left && rootRight?.left == rootLeft?.right{
//            if rootLeft?.val == rootRight?.val{
//                return self.treeNodeEqule(rootLeft?.left, rootRight?.right) && self.treeNodeEqule(rootLeft?.right, rootRight?.left)
//            }else{
//                return false
//            }
//        }
//       return false
//
//    }
}
