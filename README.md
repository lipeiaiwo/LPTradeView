![Image text](http://img0.ph.126.net/uqEChaa0XRZaAweKnyt5YA==/6630395964096162618.gif)

调用非常简单,就一个类方法,选择你需要的密码类型就可以了,密码会通过block返回.

/** 快速创建6位数字的密码 带Block回调密码 带自定义数字键盘 只能输入6位数字密码 */
+ + (instancetype)tradeViewNumberKeyboardWithMoney:(NSString *)money password:(void (^) (NSString *password))password;

/** 快速创建多位的混合密码 带Block回调密码 带系统组合键盘 不限制输入 */
+ + (instancetype)tradeViewHybridKeyboardWithMoney:(NSString *)money password:(void (^) (NSString *password))password;




在具体地方 调用就可以了

// 纯数字密码
- - (IBAction)btn1:(id)sender {
    
    [LPTradeView tradeViewNumberKeyboardWithMoney:@"88.25" password:^(NSString *password) {
        
        NSLog(@"密码是:%@",password);
        
    }];
    
    
}


// 混合密码
-  -(IBAction)btn2:(id)sender {
    
    [LPTradeView tradeViewHybridKeyboardWithMoney:@"88.28" password:^(NSString *password) {
        
        NSLog(@"密码是:%@",password);
        
    }];
}
