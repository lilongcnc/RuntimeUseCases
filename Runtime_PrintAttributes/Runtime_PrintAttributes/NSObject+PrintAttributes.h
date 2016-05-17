//
//  NSObject+PrintAttributes.h
//  Runtime_PrintAttributes
//
//  Created by 李龙 on 16/5/17.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PrintAttributes)

// 自动打印属性字符串
+ (void)resolveDict:(NSDictionary *)dict;

@end
