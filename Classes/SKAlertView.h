//
//  SKAlertView.h
//  SKCommons
//
//  Created by skuzniarz on 09/10/12.
//  Copyright (c) 2012-2013 Szczepan Kuźniarz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SKAlertBlock)(void);

@interface SKAlertView : UIAlertView {
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle;
+ (void)showWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle buttonBlock:(SKAlertBlock)buttonBlock;
+ (void)showWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelBlock:(SKAlertBlock)cancelBlock otherTitle:(NSString *)otherTitle otherBlock:(SKAlertBlock)otherBlock;

@end