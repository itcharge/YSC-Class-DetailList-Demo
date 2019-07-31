//
//  XXViewController.m
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/30.
//  Copyright © 2019 bujige. All rights reserved.
//

#import "XXViewController.h"

@interface XXViewController ()

@end

@implementation XXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI {
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    [self.navigationItem setTitle:@"XXViewController"];
    
    UILabel *IDLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,  self.view.bounds.size.height/2-20-40, (self.view.bounds.size.width-60), 40)];
    [IDLabel setTextAlignment:NSTextAlignmentCenter];
    [IDLabel setFont:[UIFont systemFontOfSize:18]];
    [IDLabel setText:[NSString stringWithFormat:@"ID = %@",self.ID]];
    [self.view addSubview:IDLabel];
    
    UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, self.view.bounds.size.height/2+20, (self.view.bounds.size.width-60), 40)];
    [typeLabel setTextAlignment:NSTextAlignmentCenter];
    [typeLabel setFont:[UIFont systemFontOfSize:18]];
    [typeLabel setText:[NSString stringWithFormat:@"type = %@",self.type]];
    [self.view addSubview:typeLabel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
