//
//  ViewController.m
//  Runtime_changeAttributeValue
//
//  Created by 李龙 on 16/5/21.
//  Copyright © 2016年 lauren. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (nonatomic, strong) Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [Person new];
    _person.name = @"ZhangSan";
    NSLog(@"the person name is %@",self.person.name);
 
    
    [self changeName];
}


- (void)changeName
{
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([self.person class], &count);
    for (int i = 0; i<count; i++) {
        Ivar var = ivar[i];
        const char *varName = ivar_getName(var);
        NSString *proname = [NSString stringWithUTF8String:varName];
        
        if ([proname isEqualToString:@"_name"]) {   //这里别忘了给属性加下划线
            object_setIvar(self.person, var, @"LiSi");
            break;
        }
    }
    NSLog(@"the person changed name is %@",self.person.name);
    
}




@end
