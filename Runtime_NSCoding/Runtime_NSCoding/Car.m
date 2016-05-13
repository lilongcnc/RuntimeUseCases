//
//  Car.m
//  RuntimeDemo1
//
//  Created by 李龙 on 16/5/12.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "Car.h"
#import <objc/runtime.h>
#import "CodingHeader.h"
@implementation Car

//继承了UIView

//使用这个会崩溃,需要在解档方法中增加空值的判断
//codingImplementation





//下列代码解开注释,可以正常运行
//// 解档方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) { //if (self = [super init]) {
        // 获取所有成员变量
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);

        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            // 将每个成员变量名转换为NSString对象类型
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];

            // 忽略不需要解档的属性
            if ([[self ignoredNames] containsObject:key]) {
                continue;
            }

            // 根据变量名解档取值，无论是什么类型
            id value = [aDecoder decodeObjectForKey:key];
            // 取出的值再设置给属性
            [self setValue:value forKey:key];
            // 这两步就相当于以前的 self.age = [aDecoder decodeObjectForKey:@"_age"];
        }
        // 注意释放内存！
        free(ivars);
    }
    return self;
}

- (NSArray *)ignoredNames {
    return @[@"_age"];
}


// 归档调用方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    // 获取所有成员变量
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        // 将每个成员变量名转换为NSString对象类型
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 忽略不需要归档的属性
        if ([[self ignoredNames] containsObject:key]) {
            continue;
        }
        
        // 通过成员变量名，取出成员变量的值
        id value = [self valueForKeyPath:key];
        // 再将值归档
        [aCoder encodeObject:value forKey:key];
        // 这两步就相当于 [aCoder encodeObject:@(self.age) forKey:@"_age"];
    }
    free(ivars);
}

@end
