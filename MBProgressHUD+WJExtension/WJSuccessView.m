//
//  WJSuccessView.m
//  WJTool
//
//  Created by 陈威杰 on 2017/6/3.
//  Copyright © 2017年 ChenWeiJie. All rights reserved.
//

#import "WJSuccessView.h"

@implementation WJSuccessView
{
    CAShapeLayer *_shapeLayer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}



- (void)setWj_animationType:(WJAnimationType)wj_animationType{
    _wj_animationType = wj_animationType;
    
    [self drawSuccessErrorLine];
}



- (void)drawSuccessErrorLine{

    //半径
    CGFloat radius = self.frame.size.width / 2;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    if (_wj_animationType == WJAnimationTypeSuccess) {
        [path moveToPoint:CGPointMake(self.center.x - radius + 5, self.center.y)];
        [path addLineToPoint:CGPointMake(self.center.x - 3.0f, self.center.y + 10.0f)];
        [path addLineToPoint:CGPointMake(self.center.x + radius - 5, self.center.y - 10)];
    } else if (_wj_animationType == WJAnimationTypeError) {
        [path moveToPoint:CGPointMake(radius / 2, radius / 2)];
        [path addLineToPoint:CGPointMake(radius + radius / 2, radius + radius / 2)];
        [path moveToPoint:CGPointMake(radius / 2, radius + radius / 2)];
        [path addLineToPoint:CGPointMake(radius + radius / 2, radius / 2)];
    }

    
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.path = path.CGPath;
    //线条颜色
    _shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    //填充颜色
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.lineWidth = 5.0;
    // 设置线帽为圆
    _shapeLayer.lineCap = @"round";
    _shapeLayer.strokeStart = 0.0;
    // 该属性为 1.0 就是完成显示出来，可以通过给他动画就实现画线条出来。
    _shapeLayer.strokeEnd = 0.0;
    [self.layer addSublayer:_shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];

    [animation setFromValue:@0.0];
    [animation setToValue:@1.0];

    [animation setDuration:0.45];
   //当动画结束后,layer会一直保持着动画最后的状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [_shapeLayer addAnimation:animation forKey:@"strokeEnd"];
    
}





@end
