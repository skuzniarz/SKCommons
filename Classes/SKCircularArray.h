//
//  SKCircularArray.h
//  SKCommons
//
//  Created by skuzniarz on 14/03/14.
//  Copyright (c) 2014 Szczepan Kuźniarz. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Simple circular array.
 */
@interface SKCircularArray : NSObject

// 
@property (readonly, nonatomic) NSUInteger maxSize;

- (id)initWithMaxSize:(NSUInteger)maxSize;

- (NSNumber *)objectAtIndex:(NSUInteger)index;
- (void)addObject:(NSNumber *)anObject;
- (NSUInteger)count;

- (NSNumber *)maxValue;

@end
