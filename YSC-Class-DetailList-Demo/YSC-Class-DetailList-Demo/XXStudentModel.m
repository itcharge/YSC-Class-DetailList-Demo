//
//  XXStudentModel.m
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/31.
//  Copyright © 2019 bujige. All rights reserved.
//

#import "XXStudentModel.h"
#import "XXCourseModel.h"

@implementation XXStudentModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    //需要特别处理的属性
    return @{
             @"courses" : [XXCourseModel class],
             @"uid" : @"id"
             };
}

@end
