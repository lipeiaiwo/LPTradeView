//
//  UIAlertView+Quick.m
//  LPTradeViewDemo
//
//  Created by 黎培 on 15/11/26.
//  Copyright © 2015年 LP. All rights reserved.
//

#import "UIAlertView+Quick.h"

@implementation UIAlertView (Quick)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    [alertView show];
}

@end