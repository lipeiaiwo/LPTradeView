//
//  LPTradeInputView.h
//  sfb
//
//  Created by lr_lp on 15/8/20.
//  Copyright (c) 2015年 lr_lp. All rights reserved.
//  交易输入视图

#import <Foundation/Foundation.h>
#import "UIView+Extension.h"

@class LPTradeInputNumberView;
@protocol LPTradeInputNumberViewDelegate <NSObject>

@optional
/** 确定按钮点击 */
- (void)tradeInputNumberView:(LPTradeInputNumberView *)tradeInputView okBtnClick:(NSString *)password;
/** 取消按钮点击 */
- (void)tradeInputNumberView:(LPTradeInputNumberView *)tradeInputView cancleBtnClick:(UIButton *)cancleBtn;
/** 输入框按钮点击 */
- (void)tradeInputNumberView:(LPTradeInputNumberView *)tradeInputView inputBtnClick:(UIButton *)inputBtn;

@end

@interface LPTradeInputNumberView : UIView

// 金额
@property (nonatomic,copy) NSString *money;

@property (nonatomic, weak) id<LPTradeInputNumberViewDelegate> delegate;
@end
