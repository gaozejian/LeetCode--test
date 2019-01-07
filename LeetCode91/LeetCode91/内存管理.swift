//
//  内存管理.swift
//  LeetCode91
//
//  Created by gaozejian on 2019/1/7.
//  Copyright © 2019 solordreams. All rights reserved.
//

import UIKit

class ____: NSObject {
/*
     1. 自己生成,自己持有, alloc , new ,copy, mutableCopy
     2.非自己生成的也能持有 [NSMutableArray  array] 不持有对象 通过retain 可持有
     
     retain count :采用散列表(引用计数表)来管理引用计数器,这样可以查询引用的对象地址
     
     autorelease : runloop 生成NSAutoreleasePool  ,加入pool runloop 结束 pool 销毁
     在pool未销毁的过程中,大量产生autorelese对象,只要pool不释放,如大量读取图片
     采用@autoreleasepool{} 及时释放
     
     autorelease 的实现: NSAutoreleasePool 是一个连接列表 同NSMutableArray 相同
            AutoreleasePoolPage push pop
     
     
     二, 所有权修饰符
        对象类型,就是指NSobject 的类的指针   id 类型 是对象类型 隐藏类名称部分
     __strong 默认的 在变量作用于以及赋值
     __weak 不持有对象 使用weak 是 查询对象是否存在 不持有时直接值nil 不产生野指针
     __unsafe_unretained 同样修饰对象,不持有对象但是不自动置nil 效率高点相对于weak
     
     __autoreleasing :方法的参数 传递 NSError的对象指针,而不是返回值,这样 对象的指针直接被autorelease 修饰,直接加入autoreleasePool   方法中不需要管理参数error的引用计数，这里会生成一个__autoreleasing的临时变量，所以出现了实参传递过程中不是同一个对象。
        一般方法传递参数对象 为值传递,二nserror 为对象指针传递,这样可根据对象指针的指针去拿到对象的指针去修改对象
     https://blog.csdn.net/wnnvv/article/details/81144219
     https://www.jianshu.com/p/6f284bd7cf0a
     
     main 函数中的 @autoreleasepool 将主线程的对象加入到 runloop中,主线程销毁 那么销毁相应的UIApplicationMain
     
     
     三,
      1. init 方法初始化alloc方法返回的对象,然后原封不懂得返给调用方
         https://www.jianshu.com/p/92e095225cea
      2, id 和 void* 的转换 (__brige的原理)
      3.数组
     四,ARC 的实现
           ARC 是有编译器llvm 和runtime 共同完成
       __weak 修饰符变量所引用的对象会被注册到autoreleasepool 中,那么pool 结束之前可以正常适应,但是每次是使用__weak ,该对象都会注册到 pool,的对象也会大量增加,使用之前最好strong一下
              1.__weak 修饰符所引用的对象被废弃是,z将自动置空,
              2.使用weak的对象时,注册到autoreleasepool 中
     */
    
    /*
     block : 带有自动变量值的匿名函数
     ^ 返回值类型(参数){表达式}  ^int(int k){ return k + 1}
     
     block 捕获外部变量的值,不能被修改  如果为NSMutableArray 可以对数组操作,但是不等对数组array 赋值
      因为截获的是这个对象结构体
     不能捕获C语言数组  const char text[] = "sdsd"  修改成 const char *text[] = "sdsd"
     
     */
    
    /*
     多线程问题 :1.死锁,2,抢占资源线程安全3,消耗大量内存
     GCD 把任务添加到 DispathQueue
     分为:serial DispathQueue  串行队列 等待当前处理结束
          Concurrent DispathQueue 并发 不等待
     
     可以生成多个 serial DispathQueue 共同添加任务  这样会生成多个线程 消耗资源
     获取queue方法1.
     DispathQueue 手动管理内存 生命周期 dispath_quate_t myquen = disnpatch_queue_create("name",宏)
     dispatch_release 释放   不能设置优先级 都是默认级别
     
     方法2.系统生成 Main dispatch queue(串行,添加到主线后面)  和 global dispatch queue(并行)
     
     global dispatch queue 有四个优先级 高,默认 低,后台
     
     dispatch_queue_t mianqueue = dispatch_get_main_queue()
     
     dispatch_queue_t globalqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
     这两个 进行dispatch_retain 和 dispatch_release 没有影响  使用起来更加简单
     */
}
