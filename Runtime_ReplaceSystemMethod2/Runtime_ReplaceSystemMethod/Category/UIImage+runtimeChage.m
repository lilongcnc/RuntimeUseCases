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
    
    
//    //获取两个类的方法
//    Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
//    Method m2 = class_getClassMethod([UIImage class], @selector(ll_imageName:));
    
//    //开始交换方法实现
//    method_exchangeImplementations(m1, m2);
    //相比较于Runtime_ReplaceSystemMethod的中直接写的method_exchangeImplementations,即上边那种写法,下面的这种方法更加的严谨一些
    
    
    NSString *className = NSStringFromClass(self.class);
    NSLog(@"classname %@", className);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //要特别注意你替换的方法到底是个性质的方法
        // When swizzling a Instance method, use the following:
//        Class class = [self class];
        
        // When swizzling a class method, use the following:
         Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(imageNamed:);
        SEL swizzledSelector = @selector(ll_imageName:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark ================ 根据系统版本不同替换系统方法 ================
+ (UIImage *)ll_imageName:(NSString *)imageName{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    NSLog(@"%f",version);
    if (version <= 8.4) {
        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的扁平化图片
        imageName = [imageName stringByAppendingString:@"_ios7"];
    }
    
    return [UIImage ll_imageName:imageName];
}



@end
