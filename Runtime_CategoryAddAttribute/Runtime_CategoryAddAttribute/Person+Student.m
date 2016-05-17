//
//  Person+Student.m
//  RuntimeDemo1
//
//  Created by 李龙 on 16/5/12.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "Person+Student.h"
#import <objc/runtime.h>


@implementation Person (Student)


//- (int)age{
//    return _age;
//}
//
//
//- (void)setAge:(int)age{
//    _age = age;
//}


//static const char *nameKey = "name";
char nameKey;
-(void)setEmail:(NSString *)email{
     // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject([Person class], &nameKey, email, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(NSString *)email{
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject([Person class], &nameKey);
}






@end
