//
//  ViewController.swift
//  LeetCode91
//
//  Created by gaozejian on 2018/9/3.
//  Copyright © 2018年 solordreams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //var leet = leetCode874.init()
        
       // [-2,-1,-2,3,7]
       // [[1,-3],[2,-3],[4,0],[-2,5],[-5,2],[0,0],[4,-4],[-2,-5],[-1,-2],[0,2]]
      //  print(leet.canJump([2,3,1,1,4]))
       //print(leet.robotSim([-2,-1,-2,3,7], [[1,-3],[2,-3],[4,0],[-2,5],[-5,2],[0,0],[4,-4],[-2,-5],[-1,-2],[0,2]]))
  //    print(leet.robotSim([4,3], [[0,3]]))
//        var tree1 = TreeNode.init(1)
//         var tree2 = TreeNode.init(2)
//        var tree5 = TreeNode.init(5)
//        tree2.left = TreeNode.init(3)
//        tree2.right = TreeNode.init(4)
//        tree5.right = TreeNode.init(6)
//        tree1.left = tree2
//        tree1.right = tree5
        
        
        var tree1 = TreeNode.init(1)
        var tree2 = TreeNode.init(2)
        var tree3 = TreeNode.init(2)
            tree2.left = TreeNode.init(3)
            tree2.right = TreeNode.init(4)
            tree3.left = TreeNode.init(4)
            tree3.right = TreeNode.init(3)
            tree1.left = tree2
            tree1.right = tree3
        //print(leet.getArr10000(20))
       // print(leet.isSymmetric(tree1))//[100,55,65,44,22,32,12,45,67,88,12,34,21,34,56,78]
        //[2,4,6,3,1,8,5,7,32,45,5,76,87,7856,4,3423,3,254,65,65,7,75,4,3,45,6,67,875434,5677,78,542,32,323,45,6567,43,]
          //print(leet.paixu([2,4,6,3,1,8,5,7,32,45,5,76,87,7856,4,3423,3,254,65,65,7,75,4,3,45,6,67,875434,5677,78,542,32,323,45,6567,43,]))//[2,4,6,3,5,1] [7,2,6,3,5,1,4]
        //[2,4,6,3,5,1,5,7,6,8,3,232,3,2,43,23,65,6,76,723,2,12,1,]
//        let leet = leetcodeMaoPao.init()
//        let arr = leet.getArr10000(20000)
//        leet.paixu1(arr)
//        leet.paixu2(arr)
//        leet.paixu3(arr)
//        leet.paixu4(arr)
//        var dui = leetcodeduipaixu.init()
//        dui.duipaixu(arr)
        let leet = leetcdoekmp.init()
        print(leet.kmp("1234561223", "45a"))
        
        
        
    }
    
    
    
    
    func decodeString(_ s: String) -> String {
        var strArr = [String]()
        var numIndex = 0
        
        for i in 0..<s.count {
            var strItmeIndex = s.index(s.endIndex, offsetBy: -(i + 1))
            var strItme = String.init(s[strItmeIndex])
            if strItme != "["{

                if self.isPurnInt(string: strItme){
                    var numStr:String = strItme

                    while  self.isPurnInt(string: strArr.last!){
                        numStr =  numStr + strArr.last!
                        strArr.remove(at: strArr.count - 1)
                    }
                    if i != s.count - 1{
                        strArr.append(numStr)
                    }else{
                        var strItmeInt:Int = Int(numStr)!
                        var strNew:String = ""
                        for j in 0..<strItmeInt{
                            strNew = strNew + strArr.last!;
                        }
                        strArr.remove(at: strArr.count - 1)
                        strArr.append(strNew)
                    }
                    
                    
                }else{
                    if strArr.count > 0 && self.isPurnInt(string: strArr.last!) {
                        var strItmeInt:Int = Int(strArr.last!)!
                        strArr.remove(at: strArr.count - 1)
                        var strNew:String = ""
                        for j in 0..<strItmeInt{
                            strNew = strNew + strArr.last!;
                        }
                      strArr.remove(at: strArr.count - 1)
                      strArr.append(strNew)
                    }
                    strArr.append(strItme)
                }
            }else{
        
                var strNew:String = ""
                
                if strArr.count > 0 && self.isPurnInt(string: strArr.last!) {
                    var strItmeInt:Int = Int(strArr.last!)!
                    strArr.remove(at: strArr.count - 1)
                    for j in 0..<strItmeInt{
                        strNew = strNew + strArr.last!;
                    }
                    strArr.remove(at: strArr.count - 1)
                    strArr.append(strNew)
                }
                strNew = ""
                while strArr.last != "]"{
                    strNew = strNew + strArr.last!;
                    strArr.remove(at: strArr.count - 1)
                }
                strArr.remove(at: strArr.count - 1)
                strArr.append(strNew)
            }
        }
        var result:String = ""
        for k in 0..<strArr.count{
            result =  strArr[k] + result
        }
       
        return result
    }
    
    func isPurnInt(string: String) -> Bool {
        let scan: Scanner = Scanner(string: string)
        var val:Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
        
    }
    
   
    func climbStairs(_ n: Int) -> Int {

        var  climb = [Int:Int]()
        
        if n == 0{
            
            climb.updateValue(0, forKey: 0)
        }
        if n == 1{
            climb.updateValue(1, forKey: 1)
        }
        if n == 2{
            climb.updateValue(2, forKey: 2)
        }
        if n > 2 {
            climb.updateValue(climb [n - 1]! + climb [n - 2]! , forKey: n)
        }
        return climb[n]!
    }
    func surfaceArea(_ grid: [[Int]]) -> Int {
        var sum = 0
        
        for i in 0..<grid.count{
            for j in 0..<grid[i].count{
                if grid[i][j] != 0{
                    sum = sum + grid[i][j] * 4 + 2
                }
                if i >= 1{
                    sum = sum - min(grid[i][j], grid[i - 1][j]) * 2
                }
                if j >= 1{
                    sum = sum - min(grid[i][j], grid[i ][j - 1]) * 2
                }
            }
        }
      return sum
    }
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var sArr = [Character]()
        for i in 0..<s.count{
            var index = s.index(s.startIndex, offsetBy: i)
            sArr.append(s[index])
        }
        var lengthDic  = [Int:Int]()
        var lengtharr  = [Character]()
        var longest  = 1
        lengtharr.append(sArr[0])
        for i in 1..<sArr.count {
            let j = i - 1
            if sArr[i] != sArr[j]{
                if lengtharr.contains(sArr[i]){
                    let ind = lengtharr.index(of: sArr[i])
                    lengtharr.remove(at: ind!)
                    if lengthDic.keys.contains(j){
                        lengthDic.updateValue(lengtharr.count - ind! - 1, forKey: j)
                    }
                }else{
                     lengtharr.append(sArr[i])
                }
               
                if lengthDic.keys.contains(j){
                    lengthDic.updateValue(lengthDic[j]! + 1, forKey: i)
                }else{
                    lengthDic.updateValue(2, forKey: i)
                }
                if longest < lengthDic[i]!{
                    longest = lengthDic[i]!
                }
            }else{
                lengtharr.removeAll()
                lengtharr.append(sArr[j])
            }
        }
        return longest
    }
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int:Int]()
        for i in 0..<nums.count {
            dic.updateValue(i, forKey: nums[i])
        }
        var resule = [Int]()
        
        for i in 0..<nums.count {
            let k = target - nums[i]
            if dic.keys.contains(k) && dic[k]! != i {
                    resule = [i,dic[k]!]
                return resule
            }
            
        }
        return []
    }
     public class ListNode {
             public var val: Int
             public var next: ListNode?
             public init(_ val: Int) {
                     self.val = val
                         self.next = nil
                 }
         }
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var head: ListNode?
        var tail: ListNode?
        var res = head
        
        var l1_node = l1;
        var l2_node = l2;
        var temp_int = 0
        while l1_node != nil || l2_node != nil {
            let l1_int : Int
            let l2_int : Int
            if l1_node != nil{
                l1_int = (l1_node?.val)!
            }else{
                l1_int = 0
            }
            
            if l2_node != nil{
                l2_int = (l2_node?.val)!
            }else{
                l2_int = 0
            }
            
            var ten_int = (l1_int + l2_int + temp_int)/10
            var l3_int = (l1_int + l2_int + temp_int)%10
            if tail == nil {
                tail = ListNode(l3_int)
                head = tail
                res = head
                temp_int = ten_int
            } else {
                tail!.next = ListNode(l3_int)
                tail = tail!.next
                temp_int = ten_int
            }
            if(l1_node != nil){
               l1_node = l1_node!.next
            }
            if(l2_node != nil){
              l2_node = l2_node!.next
            }
            if l1_node == nil && l2_node == nil{
                if ten_int > 0{
                    if tail == nil {
                        tail = ListNode(ten_int)
                        head = tail
                        res = head
                    } else {
                        tail!.next = ListNode(ten_int)
                        tail = tail!.next
                        temp_int = ten_int
                    }
                }
                return res
            }
        }
        
      return nil
    }
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var num = 0
        var begin = 0
        var start = 0
        var end = gas.count
        for i in start..<end{
            num = num + (gas[i] - cost[i] )
            if(i <= end - 1 && num <= 0){
                //start = i
                num = 0
                begin = i
                continue
            }
            if(i == end - 1 && num > 0){
                end = start
                start = 0
            }
            if(i == begin && num >= 0){
                return begin
            }else{
                return -1
            }
            
        }
        return -1
    }
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if !bank.contains(end){
            return -1
        }
        if start == end{
            return 0
        }
        var max :Int = 0
        
        var arr = [String]()
        var vists = [String]()
        var temp = [String]()
        arr.append(start)
        while arr.count > 0 {
      
            for j in 0..<arr.count{
                for k in 0..<bank.count{
                    if vists.contains(bank[k]){continue}
                    var dif :Int = 0
                    for  i in 0..<8{
                        let s = arr[j].index(arr[j].startIndex, offsetBy: i)
                        let b = bank[k].index(bank[k].startIndex, offsetBy: i)
                        if arr[j][s] != bank[k][b] {
                            dif = dif + 1
                        }
                        if(i == 7  && dif == 1){
                            if bank[k] == end {return max + 1}
                            temp.append(bank[k])
                            vists.append(bank[k])
                        }
                    }
                    
                    
                }
            }
            if temp.count == 0 {return -1}else{ max = max + 1 }
            arr = temp;temp = [];
        }
        return max
    }
    
    
    
    func longestPalindromeSubseq(_ s: String) -> Int {
        if s.count == 0{
            return 0
        }
        if s.count == 1{
            return 1
        }
        var strArr = [Character]()
        var charCount = [Character : [Int]]()
        var longest : Int = 0
        
        for  char :Character in s {
            strArr.append(char)
        }
        for i in 1..<strArr.count {
            let j = i - 1
            if strArr[i] == strArr[j]{
                let a : Character = strArr[i]
                if charCount.keys.contains(a){
                    var arr = charCount[a]!
                    
                    let count : Int =  arr.last!
                    arr[arr.count > 0 ? arr.count - 1 :0] = count + 1
                    charCount[a] = arr
                    if longest < arr.last!{
                       longest = arr.last!
                    }
                }else{
                    charCount[a] = [2]
                    let arr = charCount[a]!
                    if longest < arr.last!{
                        longest = arr.last!
                    }
                }
                
            }else{
                let a : Character = strArr[i]
                if charCount.keys.contains(a){
                    var arr = charCount[a]!
                    arr.append(1);
                    charCount[a] = arr
                    if longest < arr.last!{
                        longest = arr.last!
                    }
                }else{
                    charCount[a] = [1]
                    if longest < charCount[a]!.last!{
                        longest = charCount[a]!.last!
                    }
                }
            }
            
        }
        if strArr.last == strArr.first {
            let a : Character = strArr.first!
            if charCount.keys.contains(a) && charCount[a]!.count > 1{
                var arr : [Int] =  charCount[a]!
                
                let k : Int = arr.first! + arr.last!
                if longest < k{
                    longest = k
                }
            }
        }
       return longest
    }
    
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var keyArr = [Int]()
        var roomsArr = [Int]()
        keyArr.append(0)
        for k in 0..<rooms[0].count {
            if !keyArr.contains(rooms[0][k]){
            keyArr.append(rooms[0][k])
            }
        }
        roomsArr.append(0)
        var keyCount = keyArr.count
        var temp : Int = 0
        while keyCount < rooms.count {
            
            for i in temp..<keyCount{
                let key = keyArr[i];
                if !roomsArr.contains(key){
                    roomsArr.append(key)
                    for k in 0..<rooms[key].count{
                        if !keyArr.contains(rooms[key][k]){
                            temp = keyCount - 1
                            keyArr.append(rooms[key][k])
                            keyCount = keyArr.count
                        }
                    }
                    
                }
                if i == (keyCount - 1){
                   return (keyArr.count == rooms.count) ? true : false
                }
                
            }
        }
        return (keyArr.count == rooms.count) ? true : false
    }
    
    
    func numDecodings(_ s: String) -> Int {
        if s.count == 0{
            return 0
        }
        if s.count == 1 {
            
            return Int(s) == 0 ? 0 : 1
        }
        var strArr = [Int]()
        for  char :Character in s {
            let charStr = String(char)
            strArr.append(Int(charStr)!)
        }
        var arrCount : Int = 0
        var arrLastNum : Int = 0
        
        for  i in 1..<strArr.count {
                let k = i - 1
                let i_Int : Int = strArr[i]
                let k_Int : Int = strArr[k]
                let ik_Str = String(k_Int) + String(i_Int)
                let ik_Int : Int = Int(ik_Str)!
                if arrCount == 0 && ik_Int <= 26{
                    if k_Int == 0{
                       arrCount = 0
                       arrLastNum = 1
                        break
                    }else if i_Int == 0 {
                        arrCount = 1
                        arrLastNum = 0
                        
                    }else{
                        arrCount = 2
                        arrLastNum = 1
                    }
                }else if arrCount == 0 && ik_Int > 26 {
                    if k_Int == 0{
                        arrCount = 0
                        arrLastNum = 0
                        break
                    }else if i_Int == 0 {
                        arrCount = 0
                        arrLastNum = 0
                        break
                    }else{
                        arrCount = 1
                        arrLastNum = 1
                    }
                    
                }else if arrCount != 0 && ik_Int <= 26 {
                    let temp : Int = arrCount;
                    if i_Int != 0{
                        arrCount += arrLastNum
                        arrLastNum = temp
                    }else{
                        arrCount = arrLastNum
                        arrLastNum = 0
                    }
                    
                }else if arrCount != 0 && ik_Int > 26 {
                    
                    if i_Int != 0{
                       arrLastNum = arrCount
                    }else{
                        arrCount = 0
                        break
                    }
                }else{
                    arrCount = 0
                }
        }
        return   arrCount
    }
    
    
    
    func canCross(_ stones: [Int]) -> Bool {
        if stones.count == 1{
            return false
        }
        if stones.count == 2{
            return stones[1] - stones[0] == 1 ? true : false
        }
        var kArr = [[Int]]()
        kArr.insert([1], at: 0)
        kArr.insert([1], at: 1)
        for  i in 2..<stones.count {
            var itmeArr = [Int]()
            for j in 0..<i{
                let lastSpet : Int = stones[i] - stones[j]
                let arr = kArr[j]
              
                for index in 0..<arr.count{
                    
                    if lastSpet == arr[index] {
                        if !itmeArr.contains(lastSpet){
                            itmeArr.append(lastSpet)}
                    }else if lastSpet == (arr[index] - 1){
                        if !itmeArr.contains(lastSpet){
                            itmeArr.append(lastSpet)}
                    }else if lastSpet == (arr[index] + 1){
                        if !itmeArr.contains(lastSpet){
                            itmeArr.append(lastSpet)}
                    }
                }
            }
            kArr.insert(itmeArr, at: i)
            if i == (stones.count - 1) && kArr[i].count != 0 {
                return true
            }else if i == (stones.count - 1) && kArr[i].count == 0{
                return false
            }
        }
    return false
    }
}

