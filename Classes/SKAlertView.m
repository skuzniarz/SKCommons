//
//  SKAlertView.m
//  SKCommons
//
//  Created by skuzniarz on 09/10/12.
//  Copyright (c) 2012-2013 Szczepan Kuźniarz. All rights reserved.
//

#import "SKAlertView.h"


@interface SKAlertView ()

@property (nonatomic, copy) SKAlertBlock cancelBlock;
@property (nonatomic, copy) SKAlertBlock otherBlock;
@property (nonatomic, copy) NSString *cancelButtonTitle;
@property (nonatomic, copy) NSString *otherButtonTitle;

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(SKAlertBlock)cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(SKAlertBlock)otherBlock;

@end

@implementation SKAlertView

@synthesize cancelBlock = cancelBlock_;
@synthesize otherBlock = otherBlock_;
@synthesize cancelButtonTitle = cancelButtonTitle_;
@synthesize otherButtonTitle = otherButtonTitle_;


+ (void)showWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle {
    [self showWithTitle:title message:message cancelTitle:buttonTitle cancelBlock:nil otherTitle:nil otherBlock:nil];
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle buttonBlock:(SKAlertBlock)buttonBlock {
    [self showWithTitle:title message:message cancelTitle:buttonTitle cancelBlock:buttonBlock otherTitle:nil otherBlock:nil];
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(SKAlertBlock)cancelBlk otherTitle:(NSString *)otherTitle otherBlock:(SKAlertBlock)otherBlk {
    [[[self alloc] initWithTitle:title message:message cancelTitle:cancelTitle cancelBlock:cancelBlk otherTitle:otherTitle otherBlock:otherBlk] show];
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(SKAlertBlock)cancelBlk otherTitle:(NSString *)otherTitle otherBlock:(SKAlertBlock)otherBlk {
    if ((self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil])  != nil) {
        if ((cancelBlk == nil) && (otherBlk == nil)) {
            self.delegate = nil;
        }
        self.cancelButtonTitle = cancelTitle;
        self.otherButtonTitle = otherTitle;
        self.cancelBlock = cancelBlk;
        self.otherBlock = otherBlk;
    }
    return self;
}

#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:self.cancelButtonTitle]) {
        if (self.cancelBlock) {
            self.cancelBlock();
        }
    } else {
        if ([buttonTitle isEqualToString:self.otherButtonTitle]) {
            if (self.otherBlock) {
                self.otherBlock();
            }
        }
    }
}

@end
