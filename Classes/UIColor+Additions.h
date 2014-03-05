//
//  UIColor+Additions.h
//  SKCommons
//
//  Created by skuzniarz on 30/12/13.
//  Copyright (c) 2012-2013 Szczepan Kuźniarz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

+ (UIColor *)darkGreenColor;
+ (UIColor *)veryLightGrayColor;

+ (UIColor *)colorWithRGB:(NSString *)rgbHexString;

- (UIColor *)scaleSaturation:(CGFloat)scale;
- (UIColor *)scaleBrightness:(CGFloat)scale;

@end
