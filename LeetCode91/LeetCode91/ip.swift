//
//  ip.swift
//  LeetCode91
//
//  Created by gaozejian on 2019/1/2.
//  Copyright © 2019 solordreams. All rights reserved.
//

import UIKit

class ip: NSObject {
/*
     https://blog.csdn.net/zhangliangzi/article/details/52554439
     https://zhidao.baidu.com/question/576079521.html
     为什么需要三次握手
     https://www.cnblogs.com/laowz/p/6947539.html
     
     https://www.zhihu.com/question/24853633
     
     https://mp.weixin.qq.com/s/NIjxgx4NPn7FC4PfkHBAAQ
     
     tcp 首包 包括 :
                     源端口，接收端口，
                     序列号（seq），包括确认号（ACK）
                     ,首部偏移量
                     标志位包括 syn(同步标志位),ack(确认标志位),fin(结束标志位),reset(重置)
                     数据data
     TCP 是一种高效的稳定的通信方式(相对于UDP)
         那么提高稳定性 就需要确认信道的通畅.于是就有了"三次握手"来确保信道通畅
         通过判断数据的完整性来判断 通道的通畅
         握手过程
         于是 第一次请求链接 发送同步请求 syn = 1 同时对当前数据进行编码 seq = 随机数 (自所以是随机数 是因为第一次链接出于0位) 此时客户端出去激活状态
             第二次握手,服务器收到 syn 同步请求后,ACK标志未确认,同时得到y客户端发送的seq = 随机数,(这是服务端需要告知客户端我收到最后数据长度是多少,及 seq + length 此时length = 1 ),那么确认的 ack = seq + 1 , 服务端也需要给客户端发送自己的序列号让其验证数据的准确性  seq = 随机数  此时服务端为激活状态
             第三次握手,客户端收到服务器的请求, 拿到 服务器返回的确认码ack 与客户端第一次发送的seq + 1 进行验证 如果相等则表示通信正常收到的数据完整,此时客户端 发送ACK 确认标志位,同是 取得服务端发回的seq 赋值给ack = 服务端的seq + 1, 服务器收到到 连通
     
     其实本身也可以通过四次握手实现 及 第二次拆分为两次 (1) 确认标志位ACK 同时保存 客户端的seq
                                               (2) 发送syn 同步,同时发送 ack = seq(客户端的seq) + 1   以及自己的seq = 随机数
     因为单纯的ACK 不用确认应答,如果应答就会出现死循环,所以可以合并一起,即不是4次握手时三次 握手 实现高效
     
     如果是两次握手  即使只有前两次,只能确认,客户端知道了服务器能收到客户端的完整数据 即 客户端到>>>服务端 信道是通畅的
                因为服务端没有收到 ACK的确认状态码,即服务器不能确认 服务器到>>>客户端的信道是否通畅
                因为tcp 为双向通道 2次握手不能确认信道的通畅 也就是去了意义
     
     
     如果三次握手出现异常会怎样
           第一次握手 中途丢失,服务器未收到   那么客户端会周期性的重新发送, 一直到客户端 收到第二次握手的确认ACK
           第二次握手 中途丢失,没能达到客户端, 那么服务器会周期行的重新发送,一直到服务端 收到s第三次的握手确认ACK
           第三次握手 中途丢失,没能达到服务端
     此时情况分为: 客户端为接通状态(能发送能接收),服务端不能发送数据
               a. 假设此时双方都不传递数据,那么服务器会一直发送第二次握手,直到收到客户端的ACK确认
               b. 加入客户端此时发送数据,服务端收到 DATA + ACK ,服务端状态变为可通信,一切正常
               c. 如果服务端想发送数据 无法发送,服务端只能重复第二次握手,直到收到客户端的第三次握手
     
     
     两次握手还有另一种情况出现: 第一次握手a丢失,未到达服务器,被网络阻塞,这是客户端在此发起第一次握手b,b到达服务器然后c数据传输结束.断开.这是链接a这个无效链接又过来
     服务器应答,tcp 接通,但是数据已经传输结束,没有数据传输,不能结束,s信道被浪费占用.
     
     
     TCP 断开4次挥手
     
     由于TCP连接时全双工的，因此，每个方向都必须要单独进行关闭，这一原则是当一方完成数据发送任务后，发送一个FIN来终止这一方向的连接，
     
     收到一个FIN只是意味着这一方向上没有数据流动了，即不会再收到数据了，但是在这个TCP连接上仍然能够发送数据，直到这一方向也发送了FIN。
     
     上面可以理解为,双工信道,两方都需要 一次fin 和ack确认 所以为4 次 如下:
     第一次挥手: 客户端发起结束FIN
     第二次挥手:服务端收到客户端的fin 并应答 ACK 状态码
     第三次挥手:服务端发起结束Fin
     第四次挥手:客户端应答ACK 确认码,并且2ms 以后报文失效
     
    挥手为什么是4次不是3次
       按照握手的思路,挥手的第二次和第三次 发送ack + fin 可以一起发送,岂不是更高效么, 也就实现的三次挥手
     但是这样会出现问题就是:
                       客户端没东西发送了 发起fin 请求 但是此时客户端还是能接收数据的,
                       此时服务端如果没有数据发送了当然 可以合并到一起,但是如果有东西发送呢,如果二和三一起发送,那么服务端就不能发送数据了,
                       考虑到此 先 发送应答ack 客户端不在发数据, 这是如果服务端如果有数据发送那么可以继续发送,发送完毕以后,这是结束fin 等待应答 结束
     
     为什么会有time_wait 在第三次握手完成以后发送第四次握手,
                      如果服务端没有收到 客户端第四次挥手的ack 那么 服务端会周期性发送第三次挥手fin , 如果客户端已经释放那么服务器将不能正常关闭
                      如果有时间延迟那么可以确保服务器多次发起第三次握手确保正常退出
     
     */
}
