//
//  Person+Student.h
//  RuntimeDemo1
//
//  Created by 李龙 on 16/5/12.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "Person.h"

@interface Person (Student)

//测试一
//@property (nonatomic,copy) NSString *address; //外面调用分类属性,会崩溃

//测试二
//测试的时候放开
//- (int)age;
//- (void)setAge:(int)age;



//测试三
@property (nonatomic,copy) NSString *email;

@end
