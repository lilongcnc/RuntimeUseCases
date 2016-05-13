//
//  Pen.h
//  RuntimeDemo1
//
//  Created by 李龙 on 16/5/12.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Pen : NSObject <NSCoding>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic,copy) NSString *address;

@end
