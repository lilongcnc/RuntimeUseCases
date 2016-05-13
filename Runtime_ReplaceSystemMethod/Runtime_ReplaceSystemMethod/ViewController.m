//
//  ViewController.m
//  Runtime_ReplaceSystemMethod
//
//  Created by 李龙 on 16/5/13.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+runtimeChage.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

/**
 *
 *  拦截替换系统方法
 *  这个模拟的的是替换系统的imageName:方法,原作者的话就是"比如iOS6 升级 iOS7 后需要版本适配，根据不同系统使用不同样式图片（拟物化和扁平化），如何通过不去手动一个个修改每个UIImage的imageNamed：方法就可以实现为该方法中加入版本判断语句？"
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"========================== 替换图片方法 ==================================");
    /**
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
     UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     
     */
    self.iconView.image = [UIImage imageNamed:@"test2"];
    self.iconView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
