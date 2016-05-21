//
//  ViewController.m
//  Runtime_Runtime_ReplaceSystemMethod2_1
//
//  Created by 李龙 on 16/5/21.
//  Copyright © 2016年 lauren. All rights reserved.
//

#import "ViewController.h"
#import "LL_UIImage+runtimeChage.h"
#import "LL_UIImage.h"

@interface ViewController ()
@end

/**
 *
 *   主要是为了测试 分类中+load方法的'class_addMethod'方法的严谨效果.
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%s  %@",__FUNCTION__,[LL_UIImage ll_imageName]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
