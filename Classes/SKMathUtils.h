//
//  MathUtils.h
//  SKCommons
//
//  Created by skuzniarz on 14/03/14.
//  Copyright (c) 2014 Szczepan Kuźniarz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKMathUtils : NSObject

/**
 * Returns the greatest common divisor of m and n.
 */
+ (int)gcdOf:(int)m and:(int)n;

/**
 * Returns least common multiple of m and n.
 */
+ (int)lcmOf:(int)m and:(int)n;

@end
