//
//  NSObject+NSCodingExtension.h
//  Runtime_NSCoding
//
//  Created by 李龙 on 16/5/13.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  专门针对归档 NSCoding
 *  下面的代码我换了一个方法名（不然会覆盖系统原来的方法！），加了一个忽略属性方法是否被实现的判断，并加上了对父类属性的归解档循环。
 *  这里的方法不能归档继承UIView类的方法,这些类中默认有其他的属性,报错:NSKeyedArchiver warning: replacing existing value for key '_name'; probable duplication of encoding keys in class hierarchy
 
 */

@interface NSObject (NSCodingExtension)

- (NSArray *)ignoredNames;
- (void)encode:(NSCoder *)aCoder;
- (void)decode:(NSCoder *)aDecoder;

@end
