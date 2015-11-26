//
//  LPTradeView.h
//  sfb
//
//  Created by lr_lp on 15/8/20.
//  Copyright (c) 2015年 lr_lp. All rights reserved.

#import <UIKit/UIKit.h>

@interface LPTradeView : UIView

/** 快速创建6位数字的密码 带Block回调密码 带自定义数字键盘 只能输入6位数字密码 */
+ (instancetype)tradeViewNumberKeyboardWithMoney:(NSString *)money password:(void (^) (NSString *password))password;

/** 快速创建多位的混合密码 带Block回调密码 带系统组合键盘 不限制输入 */
+ (instancetype)tradeViewHybridKeyboardWithMoney:(NSString *)money password:(void (^) (NSString *password))password;

@end

