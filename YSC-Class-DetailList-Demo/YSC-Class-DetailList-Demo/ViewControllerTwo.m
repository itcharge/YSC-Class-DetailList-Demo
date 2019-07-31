//
//  ViewControllerTwo.m
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/30.
//  Copyright © 2019 bujige. All rights reserved.
//

#import "ViewControllerTwo.h"
#import "XXJumpControllerTool.h"

@interface ViewControllerTwo ()

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    [self.navigationItem setTitle:@"ViewControllerTwo"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 万能跳转控制器
    [self jumpController];
}

- (void)jumpController {
    
    // 定义的规则
    NSDictionary *params = @{
                             @"class" : @"XXViewController",
                             @"property" : @{
                                     @"ID" : @"321",
                                     @"type" : @"XXViewController2"
                                     }
                             };
    
    [XXJumpControllerTool pushViewControllerWithParams:params];
}

@end
