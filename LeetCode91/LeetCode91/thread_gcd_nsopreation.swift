//
//  thread_gcd_nsopreation.swift
//  LeetCode91
//
//  Created by gaozejian on 2019/1/4.
//  Copyright © 2019 solordreams. All rights reserved.
//

import UIKit

class thread_gcd_nsopreation: NSObject {
/*
     https://zhuanlan.zhihu.com/p/27420691
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
     
     二,
     dispatch_set_target_queue
     更改队列优先级
     修改执行层级:  x让异步线程 顺序执行
     dispatch_queue_t targetSerialQueue = dispatch_queue_create("com.gcd.setTargetQueue2.targetSerialQueue", NULL);
     
     //设置执行阶层
     dispatch_set_target_queue(serialQueue1, targetSerialQueue);
     dispatch_set_target_queue(serialQueue2, targetSerialQueue);
     dispatch_set_target_queue(serialQueue3, targetSerialQueue);
     dispatch_set_target_queue(serialQueue4, targetSerialQueue);
     dispatch_set_target_queue(serialQueue5, targetSerialQueue);
     dispatch_async(serialQueue1, ^{
     NSLog(@"1");
     });
     dispatch_async(serialQueue2, ^{
     NSLog(@"2");
     });
     dispatch_async(serialQueue3, ^{
     NSLog(@"3");
     });
     dispatch_async(serialQueue4, ^{
     NSLog(@"4");
     });
     dispatch_async(serialQueue5, ^{
     NSLog(@"5");
     });
     
     三 dispatch_after  是在相应队列相应时间以后添加任务
     
     四, dispatch group
     self.group = dispatch_group_create();
     dispatch_group_enter(self.group);
     dispatch_group_async(self.group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
     //请求1
     [self reuqsetDataPlannerService];////dispatch_group_leveal(self.group);
     });
     dispatch_group_enter(self.group);
     dispatch_group_async(self.group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
     //请求2
     [self requestCourseData];//dispatch_group_leveal(self.group);
     
     });
     
     dispatch_group_notify(self.group, dispatch_get_main_queue(), ^{
     
     })
     
     dispatch_async(dispatch_get_global_queue(0, 0), ^{
     
     dispatch_group_wait(disgroup, dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC));
     NSLog(@"dispatch_group_wait 结束");
     });
     
     dispatch_group_wait  设置时间限制 会阻塞线程不能放在主线程
     dispatch_barrier_asyne   dispatch_barrier_syne  插入后面任务时机不同
     
     dispatch_apply  快速迭代
     
     
     五,信号量 dispatch_semaphore
     
     dispatch_semaphore_t semaphore = dispatch_semaphore_create(2);   设置可共同执行的数量
     //任务1
     dispatch_async(quene, ^{
     dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
     NSLog(@"run task 1");
     sleep(1);
     NSLog(@"complete task 1");
     dispatch_semaphore_signal(semaphore);
     });<br>
     //任务2
     dispatch_async(quene, ^{
     dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
     NSLog(@"run task 2");
     sleep(1);
     NSLog(@"complete task 2");
     dispatch_semaphore_signal(semaphore);
     });<br>
     //任务3
     dispatch_async(quene, ^{
     dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
     NSLog(@"run task 3");
     sleep(1);
     NSLog(@"complete task 3");
     dispatch_semaphore_signal(semaphore);
     });
     
     gcd原理:
     通过结构体和链表实现FIFO队列,FIFO队列管理是通过dispatch_async 等函数所追加的block  ,block 先加入dispatch continuation 结构体再加入队列
     
     
     
     六,实现线程同步的方法:
     dispatch_set_target_queue
     dispatch_group_create
     dispatch_barrier_asyne
     dispatch_semaphore
     */
    /*
     nsopreation
     https://www.jianshu.com/p/4b1d77054b35
     
     https://www.jianshu.com/p/938d68ed832c
     锁
     
     OSSpinLock(自旋锁)和dispatch_semaphore的效率远远高于其他。
     nslock
     @synchronized和NSConditionLock效率较差。
     
     鉴于OSSpinLock的不安全，所以我们在开发中如果考虑性能的话，建议使用dispatch_semaphore。
     

     */
}
