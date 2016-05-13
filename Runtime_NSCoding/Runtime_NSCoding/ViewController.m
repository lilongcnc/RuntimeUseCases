//
//  ViewController.m
//  Runtime_NSCoding
//
//  Created by 李龙 on 16/5/13.
//  Copyright © 2016年 李龙. All rights reserved.
//


/**
 *
 * 在我们日常的归档存储的时候,需要在实体文件中实现NSCoding代理协议,然后在.m文件中实现  encodeWithCoder: / initWithCoder: 这两个方法.
 * 在我们的项目中,已经对NSCoing的归档和接档的两个方法封装到了分类中,你只需要加载头文件和写入宏就可以了
 * 需要注意的是,我们一般实现的模型都是继承NSObject的,但是比较另类的(奇葩的)如果你的模型是继承了UIView的话,使用分类,直接使用宏的话会有问题. 现在我测试的解决办法,就是抛开分类方法,直接在项目中实现归档和解档方法
 * 而且,我们在继承UIView的时候实现NSCoding,在if语句判断的时候,if(self = [super initWithCode:aDcoder]);但是如果你是继承的NSObject实现的NSCoing代理,那么是 if(self = [super init]).这个不知道大家有知道为什么的没有
 
 *   获得某个类的所有成员变量（outCount 会返回成员变量的总数） 参数： 1、哪个类 2、放一个接收值的地址，用来存放属性的个数 3、返回值：存放所有获取到的属性，通过下面两个方法可以调出名字和类型
     Ivar *class_copyIvarList(Class cls , unsigned int *outCount)
 *   获得成员变量的名字
     const char *ivar_getName(Ivar v)
 *   获得成员变量的类型
     const char *ivar_getTypeEndcoding(Ivar v)
 */


#import "ViewController.h"
#import "Pen.h"
#import "Car.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *cachePath = [cache stringByAppendingString:@"person.txt"];
    
    NSLog(@"==================== 继承UIView ===========================");
    //    测试继承UIView if(self = [super initWithCode:aDcoder])
//    Car *car = [Car new];
//    car.name3 = @"1111";
//    car.age3 = 66666;
//
//    [NSKeyedArchiver archiveRootObject:car toFile:cachePath];
//
//    Car *car1 = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
//    NSLog(@"%@  %d ",car1.name3,car1.age3);
    
    NSLog(@"==================== 继承NSObject ===========================");
    //测试使用分类
    Pen *pen = [Pen new];
    pen.name = @"1111";
    pen.age = 66666;
    pen.address = @"666669999999999";
    
    [NSKeyedArchiver archiveRootObject:pen toFile:cachePath];
    
    Pen *pen1 = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
    NSLog(@"%@  %d %@ ",pen1.name,pen1.age,pen1.address);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
