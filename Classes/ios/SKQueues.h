//
//  SKQueues.h
//  SKCommons
//
//  Copyright (c) 2012 Szczepan Kuźniarz. All rights reserved.
//

@protocol SKRunnable <NSObject>

- (void)run;

@end

@interface SKQueues : NSObject

+ (void)dispatchAsync:(dispatch_block_t) block;
+ (void)dispatchAsync:(dispatch_block_t)block withPriority:(dispatch_queue_priority_t)priority;
+ (void)dispatchOnMainQueue:(dispatch_block_t) block;
+ (void)execute:(id<SKRunnable>)runnable;
+ (void)execute:(id<SKRunnable>)runnable withPriority:(dispatch_queue_priority_t)priority;
+ (void)executeOnMainQueue:(id<SKRunnable>)runnable;

@end
