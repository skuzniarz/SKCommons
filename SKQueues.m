//
//  SKQueues.m
//  SKCommons
//
//  Created by skuzniarz on 04/02/13.
//  Copyright (c) 2013 Szczepan Kuzniarz. All rights reserved.
//

#import "SKQueues.h"

@implementation SKQueues

+ (void)dispatchAsync:(dispatch_block_t) block {
    dispatch_async(dispatch_get_global_queue(0, 0), block);
}

+ (void)dispatchAsync:(dispatch_block_t)block withPriority:(dispatch_queue_priority_t) priority {
    dispatch_async(dispatch_get_global_queue(priority, 0), block);
}

+ (void)dispatchOnMainQueue:(dispatch_block_t) block {
    dispatch_async(dispatch_get_main_queue(), block);
}

+ (void)execute:(id<SKRunnable>)runnable {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ [runnable run]; });
}

+ (void)execute:(id<SKRunnable>)runnable withPriority:(dispatch_queue_priority_t)priority {
    dispatch_async(dispatch_get_global_queue(priority, 0), ^{ [runnable run]; });
}

+ (void)executeOnMainQueue:(id<SKRunnable>)runnable {
    dispatch_async(dispatch_get_main_queue(), ^{ [runnable run]; });
}

@end
