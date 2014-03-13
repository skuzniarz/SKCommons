//
//  SKLabel.m
//  SKCommons
//
//  Created by skuzniarz on 13/03/14.
//  Copyright (c) 2014 Szczepan Kuźniarz. All rights reserved.
//

#import "SKLabel.h"

@implementation SKLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textEdgeInsets = UIEdgeInsetsMake(0.f, 0.f, 0, 0.f);
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textEdgeInsets)];
}

@end
