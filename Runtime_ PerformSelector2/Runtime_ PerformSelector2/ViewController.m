//
//  ViewController.m
//  Runtime_ PerformSelector2
//
//  Created by 李龙 on 16/5/19.
//  Copyright © 2016年 lauren. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

/**
 *  这种替换方法,感觉没有Runtime_ PerformSelector项目中好
 */

@interface ViewController ()
@property (nonatomic, strong) Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.person = [Person new];
    
}

- (void)sayFrom
{
    
    class_addMethod([self.person class], @selector(guess), (IMP)guessAnswer, "v@:");
    if ([self.person respondsToSelector:@selector(guess)]) {
        //Method method = class_getInstanceMethod([self.xiaoMing class], @selector(guess));
        [self.person performSelector:@selector(guess)];
        
    } else{
        NSLog(@"Sorry,I don't know");
    }
}

void guessAnswer(id self,SEL _cmd){
    
    NSLog(@"i am from beijing");
    
}
- (IBAction)answer:(id)sender {
    
    [self sayFrom];
}

@end
