//
//  ViewController.m
//  BasicDelayAnimation
//
//  Created by Malolan on 3/24/15.
//  Copyright (c) 2015 Haptrix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.427 alpha:1.000];
    
    UIView *view = [self getBusyView];
    [self.view addSubview:view];
    CGFloat midX = CGRectGetMidX(self.view.frame);
    CGFloat midY = CGRectGetMidY(self.view.frame);
    
    view.center = CGPointMake(midX, midY);
}

- (UIView *)getBusyView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 72.0f, 60.0f)];
    view.backgroundColor = [UIColor colorWithRed:43.0f / 255.0f green:49.0f / 255.0f blue:52.0f / 255.0f alpha:1.0f];
    
    CALayer *layer1 = [self getLayerAtIndex:0];
    [view.layer addSublayer:layer1];
    CABasicAnimation *animation1 = [self getAnimationForLayer:layer1 andViewHeight:CGRectGetHeight(view.frame)];
    animation1.beginTime = CACurrentMediaTime();
    [layer1 addAnimation:animation1 forKey:nil];
    
    CALayer *layer2 = [self getLayerAtIndex:1];
    [view.layer addSublayer:layer2];
    CABasicAnimation *animation2 = [self getAnimationForLayer:layer2 andViewHeight:CGRectGetHeight(view.frame)];
    animation2.beginTime = CACurrentMediaTime() + 0.15f;
    [layer2 addAnimation:animation2 forKey:nil];
    
    CALayer *layer3 = [self getLayerAtIndex:2];
    [view.layer addSublayer:layer3];
    CABasicAnimation *animation3 = [self getAnimationForLayer:layer3 andViewHeight:CGRectGetHeight(view.frame)];
    animation3.beginTime = CACurrentMediaTime() + 0.3f;
    [layer3 addAnimation:animation3 forKey:nil];
    
    return view;
}

- (CALayer *)getLayerAtIndex:(NSUInteger)index {
    CALayer *layer = [CAShapeLayer layer];
    layer.backgroundColor = [[UIColor colorWithRed:255.0f / 255.0f green:103.0f / 255.0f blue:0.0f alpha:1.0f] CGColor];
    layer.frame = CGRectMake(12.0f + (index * 20), 0.0f, 8.0f, 20.0f);
    return layer;
}

- (CABasicAnimation *)getAnimationForLayer:(CALayer *)layer andViewHeight:(CGFloat)height {
    CGFloat layerHeight = CGRectGetHeight(layer.frame);
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, height - layerHeight, 0);
    //create a basic animation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform";
    animation.duration = 0.4f;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    animation.toValue = [NSValue valueWithCATransform3D:transform];
    
    return animation;
}

@end
