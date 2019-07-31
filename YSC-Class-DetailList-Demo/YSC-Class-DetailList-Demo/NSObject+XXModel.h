//
//  NSObject+XXModel.h
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/30.
//  Copyright © 2019 bujige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//XXModel 协议
@protocol XXModel <NSObject>

@optional
// 返回一个字典，表明特殊字段的处理规则
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass;

@end;

@interface NSObject (XXModel)

// 字典转模型方法
+ (instancetype)xx_modelWithDictionary:(NSDictionary *)dictionary;

- (instancetype)xx_modelInitWithCoder:(NSCoder *)aDecoder;

- (void)xx_modelEncodeWithCoder:(NSCoder *)aCoder;

@end


NS_ASSUME_NONNULL_END
