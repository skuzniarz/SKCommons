//
//  MathUtils.m
//  SKCommons
//
//  Created by skuzniarz on 14/03/14.
//  Copyright (c) 2014 Szczepan Kuźniarz. All rights reserved.
//

#import "SKMathUtils.h"

@implementation SKMathUtils

+ (int)gcdOf:(int)m and:(int)n {
    int t, r;
    
    if (m < n) {
        t = m;
        m = n;
        n = t;
    }
    r = m % n;
    if (r == 0) {
        return n;
    } else {
        return [SKMathUtils gcdOf:n and:r];
    }
}

+ (int)lcmOf:(int)m and:(int)n {
    return (m * n) / [SKMathUtils gcdOf:n and:m];
}

@end
