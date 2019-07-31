//
//  XXStudentModel.h
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/31.
//  Copyright © 2019 bujige. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+XXModel.h"
@class XXAdressModel, XXCourseModel;

NS_ASSUME_NONNULL_BEGIN

@interface XXStudentModel : NSObject <XXModel>

/* 姓名 */
@property (nonatomic, copy) NSString *name;
/* 学生号 id */
@property (nonatomic, copy) NSString *uid;
/* 年龄 */
@property (nonatomic, assign) NSInteger age;
/* 体重 */
@property (nonatomic, assign) NSInteger weight;
/* 地址（嵌套模型） */
@property (nonatomic, strong) XXAdressModel *address;
/* 课程（嵌套模型数组） */
@property (nonatomic, strong) NSArray *courses;

@end

NS_ASSUME_NONNULL_END
