//
//  XXPerson.m
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/31.
//  Copyright © 2019 bujige. All rights reserved.
//

#import "XXPerson.h"
#import "NSObject+XXModel.h"

@implementation XXPerson

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        [self xx_modelInitWithCoder:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self xx_modelEncodeWithCoder:aCoder];
}

@end
