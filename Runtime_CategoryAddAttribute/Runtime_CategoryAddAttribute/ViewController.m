//
//  ViewController.m
//  Runtime_CategoryAddAttribute
//
//  Created by 李龙 on 16/5/13.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"==================== 在分类中设置属性，给任何一个对象设置属性 ===========================");
    /**
     *  众所周知，分类中是无法设置属性的，如果在分类的声明中写@property 只能为其生成get 和 set 方法的声明，但无法生成成员变量，就是虽然点语法能调用出来，但程序执行后会crash
     */
//        Person *pp = [Person new];
//        pp.address = @"北京市海淀区"; //在分类中@property直接赋值 会crash,因为生成不了
//        [pp setAge:10];
//        NSLog(@"get property age from %d",[pp age]);
//    
//        Person *pp2 = [Person new];
//        [pp2 setAge:20];
//        NSLog(@"get property age from %d",[pp age]);
    
    
    
    /**
     *  但是全局变量程序整个执行过程中内存中只有一份，我们创建多个对象修改其属性值都会修改同一个变量，这样就无法保证像属性一样每个对象都拥有其自己的属性值。这时我们就需要借助runtime为分类增加属性的功能了。
     */
    
        //Runtime增加属性
//        Person *person2 = [Person new];
//        person2.email = @"lilongcnc@vip.qq.com";
//        NSLog(@"person2.email:%@",person2.email);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
