//
//  LPTradeInputHybridView.h
//  sfb
//
//  Created by lr_lp on 15/8/20.
//  Copyright (c) 2015年 lr_lp. All rights reserved.
//  交易输入视图



#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

@class LPTradeInputHybridView;

@protocol LPTradeInputHybridViewDelegate <NSObject>

@optional
/** 确定按钮点击 */
- (void)tradeInputHybridView:(LPTradeInputHybridView *)tradeInputView okBtnClick:(NSString *)password;
/** 取消按钮点击 */
- (void)tradeInputHybridView:(LPTradeInputHybridView *)tradeInputView cancleBtnClick:(UIButton *)cancleBtn;

@end

@interface LPTradeInputHybridView : UIView

// 金额
@property (nonatomic,copy) NSString *money;

@property (nonatomic, weak) id<LPTradeInputHybridViewDelegate> delegate;
@end
