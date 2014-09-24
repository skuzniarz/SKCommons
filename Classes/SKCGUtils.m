//
//  CGUtils.m
//  SKCommons
//
//  Created by skuzniarz on 09/27/13.
//  Copyright (c) 2013-2014 Szczepan Kuzniarz. All rights reserved.
//

#import "SKCGUtils.h"
#import <UIKit/UIKit.h>

@implementation SKCGUtils

+ (CGFloat)roundpx:(CGFloat)value {
    CGFloat scale = [UIScreen mainScreen].scale;
    if (scale == 1.f) {
        return roundf(value);
    }
    return (roundf(value * scale) / scale);
}

+ (CGFloat)floorpx:(CGFloat)value {
    CGFloat scale = [UIScreen mainScreen].scale;
    if (scale == 1.f) {
        return floorf(value);
    }
    return (floorf(value * scale) / scale);
}

+ (CGFloat)ceilpx:(CGFloat)value {
    CGFloat scale = [UIScreen mainScreen].scale;
    if (scale == 1.f) {
        return ceilf(value);
    }
    return (ceilf(value * scale) / scale);
}

+ (CGFloat)deg2rad:(CGFloat)degrees {
    return (degrees * (CGFloat) M_PI) / 180.f;
}

+ (CGFloat)rad2deg:(CGFloat)radians {
    return (radians * 180.f) / (CGFloat) M_PI;
}

@end
