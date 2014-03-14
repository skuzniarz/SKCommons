//
//  SKCircularArray.m
//  SKCommons
//
//  Created by skuzniarz on 14/03/14.
//  Copyright (c) 2014 Szczepan Kuźniarz. All rights reserved.
//

#import "SKCircularArray.h"


@interface SKCircularArray()

@property (nonatomic) NSUInteger maxSize;
@property (nonatomic, strong) NSMutableArray *storage;
@property (nonatomic) NSUInteger virtualCount;

@end


@implementation SKCircularArray

- (id)initWithMaxSize:(NSUInteger)maxSize {
    self = [super init];
    if (self != nil) {
        self.maxSize = maxSize;
        self.storage = [NSMutableArray arrayWithCapacity:maxSize];
        self.virtualCount = 0;
    }
    return self;
}

- (NSNumber *)objectAtIndex:(NSUInteger)index {
    if (index >= self.virtualCount) {
        @throw [NSException exceptionWithName:NSRangeException reason:@"index beyond bounds" userInfo:nil];
    }
    return (NSNumber *)[self.storage objectAtIndex:(index % self.maxSize)];
}

- (void)addObject:(NSNumber *)anObject {
    if ([self.storage count] < self.maxSize) {
        [self.storage addObject:anObject];
    } else {
        [self.storage replaceObjectAtIndex:(self.virtualCount % self.maxSize) withObject:anObject];
    }
    self.virtualCount += 1;
}

- (NSUInteger)count {
    return self.virtualCount;
}

- (NSNumber *)maxValue {
    if (self.virtualCount == 0) {
        return nil;
    }
    NSUInteger count = self.virtualCount < self.maxSize ? self.virtualCount : self.maxSize;
    NSNumber *result = self.storage[0];
    for (NSUInteger i = 1 ; i < count ; i++) {
        if ([self.storage[i] compare:result] == NSOrderedDescending) {
            result = self.storage[i];
        }
    }
    return result;
}

@end
