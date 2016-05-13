//
//  CodingHeader.h
//  Runtime_NSCoding
//
//  Created by 李龙 on 16/5/13.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "NSObject+NSCodingExtension.h"


#define codingImplementation\
- (instancetype)initWithCoder:(NSCoder *)aDecoder{\
if (self = [super init]) {\
[self decode:aDecoder];\
}\
return self;\
}\
-(void)encodeWithCoder:(NSCoder *)aCoder{\
[self encode:aCoder];\
}