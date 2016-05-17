//
//  ViewController.m
//  Runtime_PrintAttributes
//
//  Created by 李龙 on 16/5/17.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+PrintAttributes.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"model.json" ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    
    [NSObject resolveDict:jsonDict];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
