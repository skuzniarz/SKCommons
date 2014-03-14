//
//  UIColor+Additions.m
//  SKCommons
//
//  Created by skuzniarz on 30/12/13.
//  Copyright (c) 2013-2014 Szczepan Kuźniarz. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)

+ (UIColor *)darkGreenColor {
    return [UIColor colorWithRed:0.f green:0.5f blue:0.f alpha:1.f];
}

+ (UIColor *)veryLightGrayColor {
    return [UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.f];
}

+ (UIColor *)colorWithRGB:(NSString *)rgbHexString {
    if ([rgbHexString hasPrefix:@"#"]) {
        rgbHexString = [rgbHexString substringFromIndex:1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:rgbHexString];
    unsigned int rgba;
    if (![scanner scanHexInt:&rgba]) {
        return [UIColor blackColor];
    } else {
        CGFloat r = ((CGFloat)((rgba >> 16) & 0x000000ff)) / 255.f;
        CGFloat g = ((CGFloat)((rgba >>  8) & 0x000000ff)) / 255.f;
        CGFloat b = ((CGFloat)((rgba >>  0) & 0x000000ff)) / 255.f;
        return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    }
}

+ (UIColor *)colorWithARGB:(NSString *)argbHexString {
    if ([argbHexString hasPrefix:@"#"]) {
        argbHexString = [argbHexString substringFromIndex:1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:argbHexString];
    unsigned int argb;
    if (![scanner scanHexInt:&argb]) {
        return [UIColor blackColor];
    } else {
        CGFloat a = ((CGFloat)((argb >> 24) & 0x000000ff)) / 255.f;
        CGFloat r = ((CGFloat)((argb >> 16) & 0x000000ff)) / 255.f;
        CGFloat g = ((CGFloat)((argb >>  8) & 0x000000ff)) / 255.f;
        CGFloat b = ((CGFloat)((argb >>  0) & 0x000000ff)) / 255.f;
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
}

- (UIColor *)scaleSaturation:(CGFloat)scale {
    if (scale < 0.f) {
        @throw([NSException exceptionWithName:NSInvalidArgumentException reason:@"scale < 0" userInfo:nil]);
    }
    CGFloat hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        saturation *= scale;
        saturation = (saturation <= 1.f) ? brightness : 1.f;
        return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    } else {
        return self;
    }
}

- (UIColor *)scaleBrightness:(CGFloat)scale {
    if (scale < 0.f) {
        @throw([NSException exceptionWithName:NSInvalidArgumentException reason:@"scale < 0" userInfo:nil]);
    }
    CGFloat hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        brightness *= scale;
        brightness = (brightness <= 1.f) ? brightness : 1.f;
        return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
    } else {
        return self;
    }
}

@end
