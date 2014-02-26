//
//  SKNSUtils.h
//  SKCommons
//
//  Created by skuzniarz on 10/13/13.
//  Copyright (c) 2013-2014 Szczepan Kuzniarz. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Miscellaneous utilities.
 */
@interface SKNSUtils : NSObject

/**
 * Current time (sine 1970-01-01 00:00) in milliseconds.
 */
+ (double)currentTimeMillis;

/**
 * Current application documents directory.
 */
+ (NSURL *)applicationDocumentsDirectory;

/**
 * URL of the document with "documentName" in documents directory.
 */
+ (NSURL *)documentURL:(NSString *)documentName;

/**
 * Writes NSCoding compliant object under the key "key" into a document "documentName" in documents directory.
 */
+ (void)serializeObject:(id<NSCoding>)object intoDocument:(NSString *)documentName withKey:(NSString *)key;

/**
 * Reads object stored under the key "key" from document "documentName" in documents directory.
 */
+ (id)deserializeObjectFromDocument:(NSString *)documentName withKey:(NSString *)key;

/**
 * Returns YES if the given string is not nil, is not empty and contains at least one character
 * different from whitespace character.
 */
+ (BOOL)hasText:(NSString *)string;

@end
