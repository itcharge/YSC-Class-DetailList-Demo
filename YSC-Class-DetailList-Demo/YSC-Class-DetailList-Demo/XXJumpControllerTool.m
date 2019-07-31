//
//  XXJumpControllerTool.m
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/30.
//  Copyright © 2019 bujige. All rights reserved.
//

#import "XXJumpControllerTool.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation XXJumpControllerTool

+ (void)pushViewControllerWithParams:(NSDictionary *)params {
    NSString *classNameStr = [NSString stringWithFormat:@"%@", params[@"class"]];
    
    const char *className = [classNameStr cStringUsingEncoding:NSASCIIStringEncoding];
    
    // 从一个字串返回一个类
    Class newClass = objc_getClass(className);
    if (!newClass) {
        // 创建一个类
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        // 注册你创建的这个类
        objc_registerClassPair(newClass);
    }
    // 创建对象
    id instance = [[newClass alloc] init];
    
    NSDictionary *propertys = params[@"property"];
    [propertys enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        // 检测这个对象是否存在该属性
        if ([XXJumpControllerTool checkIsExistPropertyWithInstance:instance verifyPropertyName:key]) {
            // 利用kvc赋值
            [instance setValue:obj forKey:key];
        }
    }];
    
    
    // 跳转到对应的控制器
    [[XXJumpControllerTool topViewController].navigationController pushViewController:instance animated:YES];
}


// 检测对象是否存在该属性
+ (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName {
    unsigned int count, i;
    
    // 获取对象里的属性列表
    objc_property_t *properties = class_copyPropertyList([instance class], &count);
    
    for (i = 0; i < count; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    
    return NO;
}

// 获取当前显示在屏幕最顶层的 ViewController
+ (UIViewController *)topViewController {
    UIViewController *resultVC = [XXJumpControllerTool _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [XXJumpControllerTool _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [XXJumpControllerTool _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [XXJumpControllerTool _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
