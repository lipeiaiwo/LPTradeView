//
//  LPTradeInputView.m
//  sfb
//
//  Created by lr_lp on 15/8/20.
//  Copyright (c) 2015年 lr_lp. All rights reserved.
//

#define LPTradeInputViewNumCount 6

// 快速生成颜色
#define LPColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

typedef enum {
    LPTradeInputViewButtonTypeWithCancle = 10000,
    LPTradeInputViewButtonTypeWithOk = 20000,
}LPTradeInputViewButtonType;

#import "LPTradeInputNumberView.h"
#import "LPTradeKeyboard.h"
#import "NSString+Extension.h"

@interface LPTradeInputNumberView ()
/** 数字数组 */
@property (nonatomic, strong) NSMutableArray *nums;
/** 确定按钮 */
@property (nonatomic, weak) UIButton *okBtn;
/** 取消按钮 */
@property (nonatomic, weak) UIButton *cancleBtn;
/** 密码框点击按钮 */
@property (nonatomic,weak) UIButton *fieldBtn;
@end

// 数字输入框
@implementation LPTradeInputNumberView

#pragma mark - LazyLoad

- (NSMutableArray *)nums
{
    if (_nums == nil) {
        _nums = [NSMutableArray array];
    }
    return _nums;
}

#pragma mark - LifeCircle

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        /** 注册keyboard通知 */
        [self setupKeyboardNote];
        /** 添加子控件 */
        [self setupSubViews];
    }
    return self;
}

/** 添加子控件 */
- (void)setupSubViews
{
    /** 确定按钮 */
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:okBtn];
    self.okBtn = okBtn;
    [self.okBtn setBackgroundImage:[UIImage imageNamed:@"trade.bundle/password_ok_up"] forState:UIControlStateNormal];
    [self.okBtn setBackgroundImage:[UIImage imageNamed:@"trade.bundle/password_ok_down"] forState:UIControlStateHighlighted];
    [self.okBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.okBtn.tag = LPTradeInputViewButtonTypeWithOk;
    
    /** 取消按钮 */
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cancleBtn];
    self.cancleBtn = cancleBtn;
    [self.cancleBtn setBackgroundImage:[UIImage imageNamed:@"trade.bundle/password_cancel_up"] forState:UIControlStateNormal];
    [self.cancleBtn setBackgroundImage:[UIImage imageNamed:@"trade.bundle/password_cancel_down"] forState:UIControlStateHighlighted];
    [self.cancleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.cancleBtn.tag = LPTradeInputViewButtonTypeWithCancle;
}

/** 注册keyboard通知 */
- (void)setupKeyboardNote
{
    // 删除通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(delete) name:LPTradeKeyboardDeleteButtonClick object:nil];
    
    // 数字通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(number:) name:LPTradeKeyboardNumberButtonClick object:nil];
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /** 取消按钮 */
    self.cancleBtn.width = LPScreenWidth * 0.409375;
    self.cancleBtn.height = LPScreenWidth * 0.128125;
    self.cancleBtn.x = LPScreenWidth * 0.05;
    self.cancleBtn.y = self.height - (LPScreenWidth * 0.05 + self.cancleBtn.height);
    
    /** 确定按钮 */
    self.okBtn.y = self.cancleBtn.y;
    self.okBtn.width = self.cancleBtn.width;
    self.okBtn.height = self.cancleBtn.height;
    self.okBtn.x = CGRectGetMaxX(self.cancleBtn.frame) + LPScreenWidth * 0.025;
}

#pragma mark - Private

// 删除
- (void)delete
{
    [self.nums removeLastObject];
    [self setNeedsDisplay];
}

// 数字
- (void)number:(NSNotification *)note
{
    if (self.nums.count >= LPTradeInputViewNumCount) return;
    NSDictionary *userInfo = note.userInfo;
    NSNumber *numObj = userInfo[LPTradeKeyboardNumberKey];
    [self.nums addObject:numObj];
    [self setNeedsDisplay];
}

// 输入框的点击
- (void)inputBtnClick
{
    if([self.delegate respondsToSelector:@selector(tradeInputNumberView:inputBtnClick:)])
    {
        [self.delegate tradeInputNumberView:self inputBtnClick:nil];
    }
}

// 按钮点击
- (void)btnClick:(UIButton *)btn
{
    if (btn.tag == LPTradeInputViewButtonTypeWithCancle) {  // 取消按钮点击
        if ([self.delegate respondsToSelector:@selector(tradeInputNumberView:cancleBtnClick:)]) {
            [self.delegate tradeInputNumberView:self cancleBtnClick:btn];
        }
    } else if (btn.tag == LPTradeInputViewButtonTypeWithOk) {  // 确定按钮点击
        
        // 包装通知字典
        NSMutableString *pwd = [NSMutableString string];
        for (int i = 0; i < self.nums.count; i++) {
            NSString *str = [NSString stringWithFormat:@"%@", self.nums[i]];
            [pwd appendString:str];
        }
        
        if ([self.delegate respondsToSelector:@selector(tradeInputNumberView:okBtnClick:)]) {
            [self.delegate tradeInputNumberView:self okBtnClick:pwd];
        }
    } else {
        
    }
}

- (void)drawRect:(CGRect)rect
{
    // 画图
    UIImage *bg = [UIImage imageNamed:@"trade.bundle/pssword_bg"];
    UIImage *field = [UIImage imageNamed:@"trade.bundle/password_in"];
    
    [bg drawInRect:rect];
    
    CGFloat x = LPScreenWidth * 0.096875 * 0.5;
    CGFloat y = LPScreenWidth * 0.40625 * 0.5 + 50;
    CGFloat w = LPScreenWidth * 0.846875;
    CGFloat h = LPScreenWidth * 0.121875;
    [field drawInRect:CGRectMake(x, y, w, h)];
    
    // 添加一个输入框的点击
    UIButton *fieldBtn = [[UIButton alloc] init];
    self.fieldBtn = fieldBtn;
    fieldBtn.frame = CGRectMake(x, y, w, h);
    
    [self addSubview:fieldBtn];
    
    [fieldBtn addTarget:self action:@selector(inputBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 画Title
    NSString *title = @"请输入支付密码";
    
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:LPScreenWidth * 0.053125] andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat titleW = size.width;
    CGFloat titleH = size.height;
    CGFloat titleX = (self.width - titleW) * 0.5;
    CGFloat titleY = LPScreenWidth * 0.065;
    CGRect titleRect = CGRectMake(titleX, titleY, titleW, titleH);
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:LPScreenWidth * 0.053125];
    attr[NSForegroundColorAttributeName] = LPColor(102, 102, 102);
    
    [title drawInRect:titleRect withAttributes:attr];
    
    // 画金额
    NSString *money = [NSString stringWithFormat:@"金额: %@",[self setMoneyComma:self.money isAndDecimal:YES]];
    
    CGSize moneySize = [money sizeWithFont:[UIFont systemFontOfSize:LPScreenWidth * 0.042667] andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat moneyW = moneySize.width;
    CGFloat moneyH = moneySize.height;
    CGFloat moneyX = (self.width - moneyW) * 0.5;
    CGFloat moneyY = LPScreenWidth * 0.24;
    
    if (LPScreenWidth == 375) {
        
        moneyY = LPScreenWidth * 0.24 - 4;
        
    }else if (LPScreenWidth == 414){
        
        moneyY = LPScreenWidth * 0.24 - 7;
    }
    
    CGRect moneyRect = CGRectMake(moneyX, moneyY, moneyW, moneyH);
    
    NSMutableDictionary *moneyAttr = [NSMutableDictionary dictionary];
    moneyAttr[NSFontAttributeName] = [UIFont systemFontOfSize:LPScreenWidth * 0.042667];
    moneyAttr[NSForegroundColorAttributeName] = LPColor(209, 47, 27);
    
    [money drawInRect:moneyRect withAttributes:moneyAttr];
    
    // 画点
    UIImage *pointImage = [UIImage imageNamed:@"trade.bundle/yuan"];
    CGFloat pointW = LPScreenWidth * 0.05;
    CGFloat pointH = pointW;
    CGFloat pointY = LPScreenWidth * 0.24 + 50;
    CGFloat pointX;
    CGFloat margin = LPScreenWidth * 0.0484375;
    CGFloat padding = LPScreenWidth * 0.045578125;
    for (int i = 0; i < self.nums.count; i++) {
        pointX = margin + padding + i * (pointW + 2 * padding);
        [pointImage drawInRect:CGRectMake(pointX, pointY, pointW, pointH)];
    }
    
    // ok按钮状态
    BOOL statue = NO;
    if (self.nums.count == LPTradeInputViewNumCount) {
        statue = YES;
        
    // 支付密码 默认修改为不需要点击确定按钮
        [self btnClick:self.okBtn];
    } else {
        statue = NO;
    }
    self.okBtn.enabled = statue;
    
    
}

// 给钱千位分隔符,是否精确到小数点后2位  带￥
- (NSString *)setMoneyComma:(NSString *)money isAndDecimal:(BOOL)isBool
{
    if([money doubleValue] == 0 || money == nil) return @"¥0.00";
    
    NSRange rang = [money rangeOfString:@"."];
    
    NSString *newStr = @"";
    
    if (rang.length) {
        
        newStr = [money substringWithRange:NSMakeRange(0, rang.location)];
    }else{
        
        newStr = money;
    }
    
    NSUInteger q = newStr.length % 3;
    
    NSString *okStr = [[NSString alloc] init];
    
    for (NSUInteger i = 0; i<newStr.length; i++) {
        
        NSString *tempStr = [newStr substringWithRange:NSMakeRange(i, 1)];
        
        if (((i - q) % 3) == 0 && i != 0 && (i - q) != -1){
            
            okStr = [okStr stringByAppendingString:@","];
        }
        
        okStr = [okStr stringByAppendingString:tempStr];
    }
    
    if (isBool) {
        
        if (rang.length) {
            
            okStr = [NSString stringWithFormat:@"¥%@%@",okStr,[money substringFromIndex:rang.location]];
        }else{
            
            okStr = [NSString stringWithFormat:@"¥%@",okStr];
        }
        
        //        NSLog(@"%@ %@",okStr,[LPTool setMoneyType:okStr]);
        
        return [self setMoneyType:okStr];
        
    }else{
        
        return [NSString stringWithFormat:@"¥%@",okStr];
    }
    
}

- (NSString *)setMoneyType:(NSString *)money
{
    //    money = [NSString stringWithFormat:@"¥%@",money];
    
    NSRange range = [money rangeOfString:@"."];
    
    if (range.location != NSNotFound) {
        
        money = [money stringByAppendingString:@"00"];
        
        return [money substringToIndex:(range.length + range.location + 2)];
        
    }else{
        
        return [money stringByAppendingString:@".00"];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
