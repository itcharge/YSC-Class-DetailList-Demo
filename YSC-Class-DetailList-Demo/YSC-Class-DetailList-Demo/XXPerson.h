//
//  XXPerson.h
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/31.
//  Copyright © 2019 bujige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XXPerson : NSObject <NSCoding>

/* 姓名 */
@property (nonatomic, copy) NSString *name;
/* 学生号 id */
@property (nonatomic, copy) NSString *uid;
/* 年龄 */
@property (nonatomic, assign) NSInteger age;
/* 体重 */
@property (nonatomic, assign) NSInteger weight;

@end

NS_ASSUME_NONNULL_END
