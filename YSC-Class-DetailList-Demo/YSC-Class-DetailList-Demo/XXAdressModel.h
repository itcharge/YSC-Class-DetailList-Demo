//
//  XXAdressModel.h
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/31.
//  Copyright © 2019 bujige. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XXAdressModel : NSObject

/* 国籍 */
@property (nonatomic, copy) NSString *country;
/* 省份 */
@property (nonatomic, copy) NSString *province;
/* 城市 */
@property (nonatomic, copy) NSString *city;

@end

NS_ASSUME_NONNULL_END
