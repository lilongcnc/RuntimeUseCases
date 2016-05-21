//
//  UIImage+runtimeChage.m
//  RuntimeDemo1
//
//  Created by 李龙 on 16/5/12.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "UIImage+runtimeChage.h"
#import <objc/runtime.h>

@implementation UIImage (runtimeChage)

//分类中重写UIImage的load方法，实现方法的交换（只要能让其执行一次方法交换语句，load再合适不过了）
+(void)load{
    //获取两个类的方法
    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([UIImage class], @selector(ll_imageName:));
    //开始交换方法实现
    method_exchangeImplementations(m1, m2);
}

#pragma mark ================ 根据系统版本不同替换系统方法 ================
+ (UIImage *)ll_imageName:(NSString *)imageName{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    NSLog(@"%f",version);
    if (version <= 8.0) {
        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的扁平化图片
        imageName = [imageName stringByAppendingString:@"_ios7"];
    }
    
    return [UIImage ll_imageName:imageName];
}



@end
