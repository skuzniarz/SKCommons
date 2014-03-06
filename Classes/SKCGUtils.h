//
//  CGUtils.h
//  SKCommons
//
//  Created by skuzniarz on 09/27/13.
//  Copyright (c) 2013-2014 Szczepan Kuzniarz. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

// convert degrees to radians
#define DEG2RAD(d) (((d) * M_PI) / 180.0)

// convert radians to degrees
#define RAD2DEG(r) (((r) * 180.0) / M_PI)


// X coordinate of CGRect
#define X(r) r.origin.x

// Y coordinate of CGRect
#define Y(r) r.origin.y

// width of CGRect
#define W(r) r.size.width

// height of CGRect
#define H(r) r.size.height

// right coordinate of CGRect
#define R(r) (r.origin.x + r.size.width)

// bottom coordinate of CGRect
#define B(r) (r.origin.y + r.size.height)


@interface SKCGUtils : NSObject

/**
 * Round to pixel (1 point on non-Retinach, 0.5 point on Retina).
 */
+ (CGFloat)roundpx:(CGFloat)value;

/**
 * Round down to pixel (1 point on non-Retinach, 0.5 point on Retina).
 */
+ (CGFloat)floorpx:(CGFloat)value;

/**
 * Round up to pixel (1 point on non-Retinach, 0.5 point on Retina).
 */
+ (CGFloat)ceilpx:(CGFloat)value;

/**
 * Convert degrees to radians.
 */
+ (CGFloat)deg2rad:(CGFloat)degrees;

/**
 * Convert radians to degrees.
 */
+ (CGFloat)rad2deg:(CGFloat)radians;

@end
