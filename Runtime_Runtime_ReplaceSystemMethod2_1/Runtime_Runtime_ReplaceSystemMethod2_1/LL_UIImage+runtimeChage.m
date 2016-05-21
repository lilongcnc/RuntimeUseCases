//
//  LL_UIImage+runtimeChage.m
//  Runtime_Runtime_ReplaceSystemMethod2_1
//
//  Created by 李龙 on 16/5/21.
//  Copyright © 2016年 lauren. All rights reserved.
//

#import "LL_UIImage+runtimeChage.h"
#import <objc/runtime.h>

@implementation LL_UIImage (runtimeChage)

/**
    前言:
    周全起见，有两种情况要考虑一下。第一种情况是要复写的方法(overridden)并没有在目标类中实现(notimplemented)，而是在其父类中实现了。第二种情况是这个方法已经存在于目标类中(does existin the class itself)。这两种情况要区别对待。
     
    (译注: 这个地方有点要明确一下，它的目的是为了使用一个重写的方法替换掉原来的方法。但重写的方法可能是在父类中重写的，也可能是在子类中重写的。)
     
    对于第一种情况，应当先在目标类增加一个新的实现方法(override)，然后将复写的方法替换为原先(的实现(original one)。
    对于第二情况(在目标类重写的方法)。这时可以通过method_exchangeImplementations来完成交换:
                                                    -以上来自:http://blog.csdn.net/horkychen/article/details/8532087
    解析:  
    dispatch_once这里不是“单例”，是保证方法替换只执行一次.
 
    说明:
    systemMethod_PrintLog:被替换方法   ll_imageName:替换方法
 
     class_addMethod:如果发现方法已经存在，会失败返回，也可以用来做检查用,我们这里是为了避免源方法没有实现的情况;如果方法没有存在,我们则先尝试添加被替换的方法的实现
     1.如果返回成功:则说明被替换方法没有存在.也就是被替换的方法没有被实现,我们需要先把这个方法实现,然后再执行我们想要的效果,用我们自定义的方法去替换被替换的方法. 这里使用到的是'class_replaceMethod'这个方法. class_replaceMethod本身会尝试调用class_addMethod和method_setImplementation，所以直接调用class_replaceMethod就可以了)
     2.如果返回失败:则说明被替换方法已经存在.直接将两个方法的实现交换即
 
 */



+(void)load{
    
    NSString *className = NSStringFromClass(self.class);
    NSLog(@"classname %@", className);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //要特别注意你替换的方法到底是个性质的方法
        // When swizzling a Instance method, use the following:
        //        Class class = [self class];
        
        // When swizzling a class method, use the following:
        Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(systemMethod_PrintLog);
        SEL swizzledSelector = @selector(ll_imageName);
        
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
+ (NSString *)ll_imageName{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    NSLog(@"%f",version);
    NSString *str = @">8.4";
    if (version <= 8.4) {
        // 如果系统版本是7.0以上，使用另外一套文件名结尾是‘_os7’的扁平化图片
        str = @"<=8.4";
        
    }
    
    return str;
}


@end
