//
//  XXTextField.m
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/30.
//  Copyright © 2019 bujige. All rights reserved.
//

#import "XXTextField.h"

@implementation XXTextField

- (void)drawPlaceholderInRect:(CGRect)rect {
    
    // 计算占位文字的 Size
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : [UIColor blueColor],
                                 NSFontAttributeName : [UIFont systemFontOfSize:15]
                                 };
    CGSize placeholderSize = [self.placeholder sizeWithAttributes:attributes];
    
    [self.placeholder drawInRect:CGRectMake(0, (rect.size.height - placeholderSize.height)/2, rect.size.width, rect.size.height) withAttributes: attributes];
}

@end
