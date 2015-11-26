//
//  UIView+Extension.h
//  LPTradeViewDemo
//
//  Created by 黎培 on 15/11/26.
//  Copyright © 2015年 LP. All rights reserved.
//
/** 设置自身x */
#define LPSetX(value) self.x = value
/** 设置自身y */
#define LPSetY(value) self.y = value
/** 设置自身centerX */
#define LPSetCenterX(value) self.centerX = value
/** 设置自身centerY */
#define LPSetCenterY(value) self.centerY = value
/** 设置自身center */
#define LPSetCenter(x, y) LPSetCenterX(x); \
SetCenterY(y)
/** 设置自身宽度 */
#define LPSetWidth(value) self.width = value
/** 设置自身高度 */
#define LPSetHeight(value) self.height = value
/** 设置自身尺寸 */
#define LPSetSize(width, height) self.size = CGSizeMake(width, height)

/** 设置控件x */
#define LPSetXForView(view, value) view.x = value
/** 设置控件y */
#define LPSetYForView(view, value) view.y = value
/** 设置控件centerX */
#define LPSetCenterXForView(view, value) view.centerX = value
/** 设置控件centerY */
#define LPSetCenterYForView(view, value) view.centerY = value
/** 设置控件center */
#define LPSetCenterForView(view, x, y) LPSetCenterXForView(view, x); \
SetCenterYForView(view, y);
/** 设置控件水平居中 */
#define AlignHorizontal(view) [view alignHorizontal]
/** 设置控件垂直居中 */
#define AlignVertical(view) [view alignVertical]
/** 设置控件宽度 */
#define LPSetWidthForView(view, value) view.width = value
/** 设置控件高度 */
#define LPSetHeightForView(view, value) view.height = value
/** 设置控件尺寸 */
#define LPSetSizeForView(view, width, height) view.size = CGSizeMake(width, height)

/** 快速添加子控件的宏定义 */
#define AddView(Class, property) [self addSubview:[Class class] propertyName:property]
#define AddViewForView(view, Class, property) [view addSubview:[Class class] propertyName:property]

// 屏幕bounds
#define LPScreenBounds [UIScreen mainScreen].bounds
// 屏幕的size
#define LPScreenSize [UIScreen mainScreen].bounds.size
// 屏幕的宽度
#define LPScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕的高度
#define LPScreenHeight [UIScreen mainScreen].bounds.size.height

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
/** 水平居中 */
- (void)alignHorizontal;
/** 垂直居中 */
- (void)alignVertical;
/** 添加子控件 */
- (void)addSubview:(Class)class propertyName:(NSString *)propertyName;
@end
