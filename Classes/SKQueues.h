//
//  SKQueues.h
//  SKCommons
//
//  Created by skuzniarz on 04/02/13.
//  Copyright (c) 2013-2014 Szczepan Kuzniarz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SKRunnable <NSObject>

- (void)run;

@end

@interface SKQueues : NSObject

+ (void)dispatchAsync:(dispatch_block_t)block;
+ (void)dispatchAsync:(dispatch_block_t)block withPriority:(dispatch_queue_priority_t)priority;
+ (void)dispatchOnMainQueue:(dispatch_block_t)block;
+ (void)dispatchOnMainQueueAndWait:(dispatch_block_t)block;
+ (void)execute:(id<SKRunnable>)runnable;
+ (void)execute:(id<SKRunnable>)runnable withPriority:(dispatch_queue_priority_t)priority;
+ (void)executeOnMainQueue:(id<SKRunnable>)runnable;

@end
