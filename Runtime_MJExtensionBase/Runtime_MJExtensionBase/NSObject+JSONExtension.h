//
//  NSObject+JSONExtension.h
//  RuntimeDemo1
//
//  Created by 李龙 on 16/5/12.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONExtension)

- (void)setDict:(NSDictionary *)dict;
+ (instancetype )objectWithDict:(NSDictionary *)dict;
// 告诉数组中都是什么类型的模型对象
- (NSString *)arrayObjectClass ;

@end
