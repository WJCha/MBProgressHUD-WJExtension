//
//  WJColouredRibbonAnimation.m
//  WJTool
//
//  Created by 陈威杰 on 2017/6/9.
//  Copyright © 2017年 ChenWeiJie. All rights reserved.
//
//------------------------------------------------------
//      非常感谢该作者提供灵感：粒子彩带散花效果源码主要参考如下：
//      https://github.com/zhangyuchang1/ScatterAnimate
//------------------------------------------------------

#import "WJColouredRibbonAnimation.h"
#import <UIKit/UIKit.h>

#define EmitterColor_Red      [UIColor colorWithRed:255/255.0 green:0 blue:139/255.0 alpha:1]
#define EmitterColor_Yellow   [UIColor colorWithRed:251/255.0 green:197/255.0 blue:13/255.0 alpha:1]
#define EmitterColor_Blue     [UIColor colorWithRed:50/255.0 green:170/255.0 blue:207/255.0 alpha:1]

@implementation WJColouredRibbonAnimation

+ (void)wj_showSuccessColouredRibbonAnimationWithHideTime:(NSTimeInterval)time {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    // 后台背景
    UIView *backgroundView = [[UIView alloc] initWithFrame:window.bounds];
    backgroundView.backgroundColor = [UIColor clearColor];
    [window addSubview:backgroundView];

    double delayInSeconds = time;
    dispatch_time_t delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(delayInNanoSeconds, dispatch_get_main_queue(), ^(void){
        
        [backgroundView removeFromSuperview];

    });
    
    //开始粒子效果
    CAEmitterLayer *emitterLayer = addEmitterLayer(backgroundView);
    startAnimate(emitterLayer);

    
}

CAEmitterLayer *addEmitterLayer(UIView *view)
{
    
    //色块粒子
    CAEmitterCell *subCell1 = subCell(imageWithColor(EmitterColor_Red));
    subCell1.name = @"red";
    CAEmitterCell *subCell2 = subCell(imageWithColor(EmitterColor_Yellow));
    subCell2.name = @"yellow";
    CAEmitterCell *subCell3 = subCell(imageWithColor(EmitterColor_Blue));
    subCell3.name = @"blue";
    CAEmitterCell *subCell4 = subCell([UIImage imageNamed:@"MBProgressExtension.bundle/success_star"]);
    subCell4.name = @"star";
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    // 发射位置
    emitterLayer.emitterPosition = view.center;
    //    emitterLayer.emitterPosition = window.center;
    //发射源的尺寸大小
    emitterLayer.emitterSize	= view.bounds.size;
    //发射模式
    emitterLayer.emitterMode	= kCAEmitterLayerOutline;
    //发射源的形状
    emitterLayer.emitterShape	= kCAEmitterLayerRectangle;
    emitterLayer.renderMode		= kCAEmitterLayerOldestFirst;
    
    emitterLayer.emitterCells = @[subCell1,subCell2,subCell3,subCell4];
    [view.layer addSublayer:emitterLayer];
    
    return emitterLayer;
    
}

void startAnimate(CAEmitterLayer *emitterLayer)
{
    // birthRate粒子参数的速度乘数因子
    CABasicAnimation *redBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.red.birthRate"];
    redBurst.fromValue		= [NSNumber numberWithFloat:30];
    redBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    redBurst.duration		= 0.5;
    redBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CABasicAnimation *yellowBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.yellow.birthRate"];
    yellowBurst.fromValue		= [NSNumber numberWithFloat:30];
    yellowBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    yellowBurst.duration		= 0.5;
    yellowBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CABasicAnimation *blueBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.blue.birthRate"];
    blueBurst.fromValue		= [NSNumber numberWithFloat:30];
    blueBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    blueBurst.duration		= 0.5;
    blueBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CABasicAnimation *starBurst = [CABasicAnimation animationWithKeyPath:@"emitterCells.star.birthRate"];
    starBurst.fromValue		= [NSNumber numberWithFloat:30];
    starBurst.toValue			= [NSNumber numberWithFloat:  0.0];
    starBurst.duration		= 0.5;
    starBurst.timingFunction	= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[redBurst,yellowBurst,blueBurst,starBurst];
    
    [emitterLayer addAnimation:group forKey:@"heartsBurst"];
}

CAEmitterCell *subCell(UIImage *image)
{
    CAEmitterCell * cell = [CAEmitterCell emitterCell];
    
    cell.name = @"heart";
    cell.contents = (__bridge id _Nullable)image.CGImage;
    
    // 缩放比例
    cell.scale      = 0.6;
    cell.scaleRange = 0.6;
    // 每秒产生的数量
    //    cell.birthRate  = 40;
    cell.lifetime   = 20;
    // 每秒变透明的速度
    //    snowCell.alphaSpeed = -0.7;
    //    snowCell.redSpeed = 0.1;
    // 秒速
    cell.velocity      = 200;
    cell.velocityRange = 200;
    cell.yAcceleration = 9.8;
    cell.xAcceleration = 0;
    //掉落的角度范围
    cell.emissionRange  = M_PI;
    
    cell.scaleSpeed		= -0.05;
    ////    cell.alphaSpeed		= -0.3;
    cell.spin			= 2 * M_PI;
    cell.spinRange		= 2 * M_PI;
    
    return cell;
}

UIImage *imageWithColor(UIColor *color)
{
    CGRect rect = CGRectMake(0, 0, 13, 17);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
