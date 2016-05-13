//
//  ViewController.m
//  Runtime_ClassMethodAndImplementationsMethodDeals
//
//  Created by 李龙 on 16/5/13.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end


/**
 *   交换两个方法的实现，拦截系统自带的方法调用功能
      需要用到的方法 <objc/runtime.h>
 *    获得某个类的类方法
      Method class_getClassMethod(Class cls , SEL name)
 *    获得某个类的实例对象方法
      Method class_getInstanceMethod(Class cls , SEL name)
 *    交换两个方法的实现
      void method_exchangeImplementations(Method m1 , Method m2)
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"========================== 获取类方法和对象方法==================================");
    Person *person = [Person new];
    Dog *dog = [Dog new];

    [person run];
    [dog eat];

    //获取实例对象方法
    Method m1 = class_getInstanceMethod([Person class], @selector(run));
    Method m2 = class_getInstanceMethod([Dog class], @selector(eat));
    method_exchangeImplementations(m1, m2);
    [person run];
    [dog eat];

    //获取类方法:class_getClassMethod
    Method m3 = class_getClassMethod([Person class], @selector(run1));
    Method m4 = class_getClassMethod([Dog class], @selector(eat1));
    method_exchangeImplementations(m3, m4);
    [Person run1];
    [Dog eat1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
