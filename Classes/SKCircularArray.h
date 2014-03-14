//
//  SKCircularArray.h
//  Jolokia
//
//  Copyright (c) 2013-2014 Szczepan Kuzniarz. All rights reserved.
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
