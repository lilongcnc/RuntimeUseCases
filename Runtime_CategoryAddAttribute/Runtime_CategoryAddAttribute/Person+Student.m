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



char nameKey;
-(void)setEmail:(NSString *)email{
     // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    objc_setAssociatedObject([Person class], &nameKey, email, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(NSString *)email{
    return objc_getAssociatedObject([Person class], &nameKey);
}






@end
