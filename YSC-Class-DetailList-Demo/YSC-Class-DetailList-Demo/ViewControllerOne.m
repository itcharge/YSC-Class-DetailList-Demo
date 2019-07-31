//
//  ViewControllerOne.m
//  YSC-Class-DetailList-Demo
//
//  Created by WalkingBoy on 2019/7/30.
//  Copyright © 2019 bujige. All rights reserved.
//

#import "ViewControllerOne.h"
#import <objc/runtime.h>
#import "XXTextField.h"
#import "XXJumpControllerTool.h"
#import "NSObject+XXModel.h"
#import "XXStudentModel.h"
#import "XXAdressModel.h"
#import "XXCourseModel.h"
#import "XXPerson.h"


@interface ViewControllerOne ()

@end

@implementation ViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
   
//    // 打印成员变量列表
//    [self printIvarList];
    
//    // 打印属性列表
//    [self printPropertyList];
    
//    // 打印方法列表
//    [self printMethodList];

//    // 打印协议列表
//    [self printProtocolList];

//    // 打印 UITextField 相关属性和成员变量列表
//    [self printUITextFieldList];

//    // 利用 KVC 更改 UITextField 占位文字字体大小和颜色
//    [self createLoginTextField];
    
//    // JSON 转模型演示
//    [self parseJSON];
    
//    // 优化归档和解档
//    [self archiver];
}

- (void)createUI {
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.navigationItem setTitle:@"ViewControllerOne"];
}

// 打印成员变量列表
- (void)printIvarList {
    unsigned int count;
    
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"ivar(%d) : %@", i, [NSString stringWithUTF8String:ivarName]);
    }
    
    free(ivarList);
}

// 打印属性列表
- (void)printPropertyList {
    unsigned int count;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"propertyName(%d) : %@", i, [NSString stringWithUTF8String:propertyName]);
    }
    
    free(propertyList);
}

// 打印方法列表
- (void)printMethodList {
    unsigned int count;
    
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method(%d) : %@", i, NSStringFromSelector(method_getName(method)));
    }
    
    free(methodList);
}


// 打印协议列表
- (void)printProtocolList {
    unsigned int count;
    
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol(%d) : %@", i, [NSString stringWithUTF8String:protocolName]);
    }
    
    free(protocolList);
}

// 打印 UITextField 相关属性和成员变量
- (void)printUITextFieldList {
    unsigned int count;
    
    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"ivar(%d) : %@", i, [NSString stringWithUTF8String:ivarName]);
    }
    
    free(ivarList);
    
    objc_property_t *propertyList = class_copyPropertyList([UITextField class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"propertyName(%d) : %@", i, [NSString stringWithUTF8String:propertyName]);
    }
    
    free(propertyList);
}

// 利用 Runtime 和 KVC 设置 UITextField 占位文字大小、颜色
- (void)createLoginTextField {
    UITextField *loginTextField = [[UITextField alloc] init];
    loginTextField.frame = CGRectMake(30,(self.view.bounds.size.height-52-50)/2, self.view.bounds.size.width-60,52);
    loginTextField.font = [UIFont systemFontOfSize:14];
    loginTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    loginTextField.textColor = [UIColor blackColor];
    
    loginTextField.placeholder = @"用户名 / 邮箱";
    [loginTextField setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    [loginTextField setValue:[UIColor lightGrayColor]forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.view addSubview:loginTextField];
}

// 字典转模型
- (void)parseJSON {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];

    // 读取 JSON 数据
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",json);

    // JSON 字典转模型
    XXStudentModel *student = [XXStudentModel xx_modelWithDictionary:json];

    NSLog(@"student.uid = %@", student.uid);
    NSLog(@"student.name = %@", student.name);

    for (unsigned int i = 0; i < student.courses.count; i++) {
        XXCourseModel *courseModel = student.courses[i];
        NSLog(@"courseModel[%d].name = %@ .desc = %@", i, courseModel.name, courseModel.desc);
    }
}

// 优化归档和解档
- (void)archiver {
    XXPerson *person = [[XXPerson alloc] init];
    person.uid = @"123412341234";
    person.name = @"行走少年郎";
    person.age = 18;
    person.weight = 120;
    
    // 归档
    NSString *path = [NSString stringWithFormat:@"%@/person.plist", NSHomeDirectory()];
    [NSKeyedArchiver archiveRootObject:person toFile:path];
    
    // 解档
    XXPerson *personObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"personObject.uid = %@", personObject.uid);
    NSLog(@"personObject.name = %@", personObject.name);
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
                                     @"ID" : @"123",
                                     @"type" : @"XXViewController1"
                                     }
                             };
    
    [XXJumpControllerTool pushViewControllerWithParams:params];
}

@end
