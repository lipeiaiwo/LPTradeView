//
//  UIAlertView+Quick.h
//  LPTradeViewDemo
//
//  Created by 黎培 on 15/11/26.
//  Copyright © 2015年 LP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Quick)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION NS_EXTENSION_UNAVAILABLE_IOS("Use UIAlertController instead.");

@end