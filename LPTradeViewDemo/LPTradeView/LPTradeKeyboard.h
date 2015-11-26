//
//  LPTradeKeyboard.h
//  sfb
//
//  Created by lr_lp on 15/8/20.
//  Copyright (c) 2015年 lr_lp. All rights reserved.
//  交易密码键盘

#import <Foundation///Foundation.h>

static NSString *LPTradeKeyboardDeleteButtonClick = @"LPTradeKeyboardDeleteButtonClick";
static NSString *LPTradeKeyboardOkButtonClick = @"LPTradeKeyboardOkButtonClick";
static NSString *LPTradeKeyboardNumberButtonClick = @"LPTradeKeyboardNumberButtonClick";
static NSString *LPTradeKeyboardNumberKey = @"LPTradeKeyboardNumberKey";

static NSString *LPTradeInputBtnClick = @"LPTradeInputBtnClick";

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

@class LPTradeKeyboard;

@protocol LPTradeKeyboardDelegate <NSObject>

@optional
/** 数字按钮点击 */
- (void)tradeKeyboard:(LPTradeKeyboard *)keyboard numBtnClick:(NSInteger)num;
/** 删除按钮点击 */
- (void)tradeKeyboardDeleteBtnClick;
/** 确定按钮点击 */
- (void)tradeKeyboardOkBtnClick;
@end

@interface LPTradeKeyboard : UIView
// 代理
@property (nonatomic, weak) id<LPTradeKeyboardDelegate> delegate;
@end