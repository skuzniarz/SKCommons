//
//  SKNSUtils.m
//  SKCommons
//
//  Created by skuzniarz on 10/13/13.
//  Copyright (c) 2013-2014 Szczepan Kuzniarz. All rights reserved.
//

#import "SKNSUtils.h"

@implementation SKNSUtils

+ (double)currentTimeMillis {
    return [[NSDate date] timeIntervalSince1970] * 1000.0;
}

+ (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)documentURL:(NSString *)storeName {
    return [[SKNSUtils applicationDocumentsDirectory] URLByAppendingPathComponent:storeName];
}

+ (void)serializeObject:(id<NSCoding>)object intoDocument:(NSString *)documentName withKey:(NSString *)key {
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:object forKey:key];
    [archiver finishEncoding];
    
    NSURL *documentURL = [SKNSUtils documentURL:documentName];
    [data writeToURL:documentURL atomically:YES];
}

+ (id<NSCoding>)deserializeObjectFromDocument:(NSString *)documentName withKey:(NSString *)key {
    NSURL *documentURL = [SKNSUtils documentURL:documentName];
    NSData *data = [NSData dataWithContentsOfURL:documentURL];
    if (data == nil) {
        return nil;
    } else {
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        id object = [unarchiver decodeObjectForKey:key];
        [unarchiver finishDecoding];
        return object;
    }
}

+ (BOOL)hasText:(NSString *)string {
    if ((string != nil) && (string.length > 0) && ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length > 0)) {
        return YES;
    } else {
        return NO;
    }
}

@end
