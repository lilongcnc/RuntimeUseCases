//
//  NSObject+NSCodingExtension.m
//  Runtime_NSCoding
//
//  Created by 李龙 on 16/5/13.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "NSObject+NSCodingExtension.h"
#import <objc/runtime.h>

@implementation NSObject (NSCodingExtension)

- (void)decode:(NSCoder *)aDecoder {
    // 一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    while (c &&c != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            //              NSLog(@"kye:%@",key);
            // 如果有实现该方法再去调用
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) continue;
            }
            
            id value = [aDecoder decodeObjectForKey:key];
//            if (value != nil) { //继承UIView的时候,你可以增加判断,则不会crash
                [self setValue:value forKey:key];
//            }
        }
        free(ivars);
        c = [c superclass];
    }
    
}

- (void)encode:(NSCoder *)aCoder {
    // 一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    NSLog(@"%@",[c class]);
    while (c &&c != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            // 如果有实现该方法再去调用
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) continue;
            }
            
            id value = [self valueForKeyPath:key];
            [aCoder encodeObject:value forKey:key];
        }
        free(ivars);
        c = [c superclass];
        NSLog(@"%@",[c class]);
    }
}


@end
