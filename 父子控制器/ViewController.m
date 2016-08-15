//
//  ViewController.m
//  父子控制器
//
//  Created by 阿拉斯加的狗 on 16/8/15.
//  Copyright © 2016年 阿拉斯加的🐶. All rights reserved.
//

#import "ViewController.h"
#import "WKOneController.h"
#import "WKTwoController.h"
#import "WKThreeController.h"


@interface ViewController ()

//记录当前控制器
@property (nonatomic,weak)UIViewController *showingVc;
//记录当前View
@property (nonatomic,weak)UIView *showingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *showingView = [[UIView alloc]init];
    
    showingView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    
    self.showingView = showingView;
    [self.view addSubview:showingView];
    
    //建立父子控制器的关系
    WKOneController *one = [[WKOneController alloc]init];
    WKTwoController *two = [[WKTwoController alloc]init];
    WKThreeController *three = [[WKThreeController alloc]init];
    
    [self addChildViewController:one];
    [self addChildViewController:two];
    [self addChildViewController:three];
    

    
    
}

- (IBAction)clickBtn:(UIButton *)sender {
    
    //移除当前vc的view
    [self.showingVc.view removeFromSuperview];
    
    //获取当前控制器的索引
    NSUInteger index = [sender.superview.subviews indexOfObject:sender];
    
    //获取old控制器的索引
    NSUInteger oldindex = [self.childViewControllers indexOfObject:self.showingVc];
    
    self.showingVc = self.childViewControllers[index];
    self.showingVc.view.frame = self.showingView.bounds;
    
    [self.showingView addSubview:self.showingVc.view];
    
    //转场动画
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    animation.duration = 0.25;
    animation.subtype = index > oldindex ? kCATransitionFromLeft : kCATransitionFromRight;
    
    [self.showingView.layer addAnimation:animation forKey:nil];
    
}


@end
