//
//  NSDictionary+Path.h
//  SKCommons
//
//  Created by skuzniarz on 19/08/13.
//  Copyright (c) 2013-2014 Szczepan Kuzniarz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (Path)

/**
 * Access to nested dictionaries. Path components are separated with '/',
 * each component denotes a key in dictionary. For instance for dictionary:
 *
 * NSDictionary *dict = @{
 *     key1 : @{
 *                internal1 : @{
 *                    value : @"defg",
 *                    dict  : @{
 *                                nested : @"1234",
 *                            }
 *                },
 *                internal2 : @{
 *                                @"7777",
 *                                @"6666",
 *                            },
 *            },
 *     key2 : @"abcd",
 * }
 *
 * [dict objectForPath:@"key1/internal1/value"] returns @"defg"
 * [dict objectForPath:@"key2"] returns @"abcd"
 *
 * Wildcards of the form @".*" are allowed, but only as complete path component
 * (not as a part of path component), for instance:
 *
 * [dict objectForPath:@"key1/internal2/.*"] is valid and returns @[ @"7777", @"6666" ]
 * [dict objectForPath:@"key1/internal.*"] is not valid
 */
- (id)objectForPath:(NSString *)path;

@end
