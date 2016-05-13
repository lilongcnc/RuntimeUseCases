//
//  ViewController.m
//  Runtime_MJExtensionBase
//
//  Created by 李龙 on 16/5/13.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "NSObject+JSONExtension.h"
#import "Book.h"

/**
 *    字段转模型,也是MJExtension的基本原理.用到的主要方法
 *    需要用到的方法
 
 *    获得某个类的所有成员变量（outCount 会返回成员变量的总数） 参数： 1、哪个类 2、放一个接收值的地址，用来存放  属性的个数 3、返回值：存放所有获取到的属性，通过下面两个方法可以调出名字和类型
      Ivar *class_copyIvarList(Class cls , unsigned int *outCount)
 *    获得成员变量的名字
      const char *ivar_getName(Ivar v)
 *    获得成员变量的类型
      const char *ivar_getTypeEndcoding(Ivar v)
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self json];
}


/// 字典转模型demo
- (void)json {
    
    // modelArrayisDict.json这个文件当中,键books对应的数组值全是单个字符串.这种情况下个时候会报错,但数组里保存的也是字典时候,不会报错
    // 因为是模拟的基本功能,大家可以后期再扩展
    NSString *path = [[NSBundle mainBundle] pathForResource:@"model.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    
    User *user = [User objectWithDict:json];
    Book *book = user.books[0];
    
    NSLog(@"%@",book.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
