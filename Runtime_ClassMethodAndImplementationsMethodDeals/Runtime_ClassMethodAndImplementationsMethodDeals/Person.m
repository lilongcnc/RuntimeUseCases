//
//  Person.m
//  RuntimeDemo1
//
//  Created by 李龙 on 16/5/12.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

- (void)run{
    NSLog(@"人跑");
}


+ (void)run1{
    NSLog(@"人跑");
}



@end
