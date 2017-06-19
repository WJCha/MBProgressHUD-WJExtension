//
//  MBProgressHUD+WJExtension.m
//  WJTool
//
//  Created by 陈威杰 on 2017/6/2.
//  Copyright © 2017年 ChenWeiJie. All rights reserved.
//

#import "MBProgressHUD+WJExtension.h"

#import "WJSuccessView.h"
#import "WJColouredRibbonAnimation.h"

@implementation MBProgressHUD (WJExtension)

#pragma mark 显示一些信息
/**
 只显示文字
 */
+ (void)wj_showText:(NSString *)text view:(nullable UIView *)view
{
    [self wj_showPlainText:text hideAfterDelay:1.0 view:view];
}

+ (void)wj_showPlainText:(NSString *)text view:(nullable UIView *)view{
    [self wj_showPlainText:text hideAfterDelay:1.0 view:view];
}

+ (void)wj_showPlainText:(NSString *)text
          hideAfterDelay:(NSTimeInterval)time
                    view:(nullable UIView *)view {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:time];
    
}



#pragma mark 显示带有自定义icon图片的消息

+ (void)wj_showIcon:(UIImage *)icon
            message:(NSString *)message
     hideAfterDelay:(NSTimeInterval)time
               view:(nullable UIView *)view{
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 默认
    //    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = message;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:icon];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:time];

    
}

/**
 显示带有自定义icon图标消息HUD
 
 @param icon 图标
 @param message 消息正文
 @param view 展示的view
 */
+ (void)wj_showIcon:(UIImage *)icon message:(NSString *)message view:(nullable UIView *)view{
//    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
//    // 快速显示一个提示信息
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    // 默认
//    //    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.labelText = message;
//    // 设置图片
//    hud.customView = [[UIImageView alloc] initWithImage:icon];
//    // 再设置模式
//    hud.mode = MBProgressHUDModeCustomView;
//    
//    
//    // 隐藏时候从父控件中移除
//    hud.removeFromSuperViewOnHide = YES;
//    
//    // 1秒之后再消失
//    [hud hide:YES afterDelay:1.0];
    
    [self wj_showIcon:icon message:message hideAfterDelay:1.0 view:view];
    
}


+ (void)wj_showIcon:(UIImage *)icon message:(NSString *)message{
    [self wj_showIcon:icon message:message view:nil];
}


#pragma mark 自定义View的方法

+ (void)wj_showCustomView:(UIView *)customView message:(nullable NSString *)message hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    if (message) {
        hud.labelText = message;
    }
    
    // 设置自定义view
    hud.customView = customView;
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 消失时间
    [hud hide:YES afterDelay:time];
}

+ (void)wj_showCustomView:(UIView *)customView hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view {
    [self wj_showCustomView:customView message:nil hideAfterDelay:time toView:view];
}

+ (void)wj_showCustomView:(UIView *)customView hideAfterDelay:(NSTimeInterval)time{
    [self wj_showCustomView:customView message:nil hideAfterDelay:time toView:nil];
}


+ (void)wj_showMessage:(nullable NSString *)message hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view customView:(UIView *(^)())customView{

    [self wj_showCustomView:customView() message:message hideAfterDelay:time toView:view];
    
}

+ (void)wj_showHideAfterDelay:(NSTimeInterval)time customView:(UIView *(^)())customView {
    
    [self wj_showCustomView:customView() hideAfterDelay:time toView:nil];
}

#pragma mark - 有加载进度的HUD

/**
 显示菊花加载状态
 
 @param message 消息正文
 @param view 展示的view
 */
+ (instancetype)wj_showActivityLoading:(nullable NSString *)message toView:(nullable UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 默认
    hud.mode = MBProgressHUDModeIndeterminate;
    
    if (message) {
        hud.labelText = message;
    }
    
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;

}

+ (instancetype)wj_showActivityLoadingToView:(nullable UIView *)view{
    return [self wj_showActivityLoading:nil toView:view];
}

+ (instancetype)wj_showActivityLoading{
    return [self wj_showActivityLoadingToView:nil];
}


+ (instancetype)wj_showAnnularLoading:(nullable NSString *)message toView:(nullable UIView *)view {
    
    return [self wj_showLoadingStyle:WJHUDLoadingStyleAnnularDeterminate
                             message:message
                              toView:view];

}

+ (instancetype)wj_showAnnularLoading {
    return [self wj_showAnnularLoading:nil toView:nil];
}



+ (instancetype)wj_showDeterminateLoading:(nullable NSString *)message toView:(nullable UIView *)view {
    
    return [self wj_showLoadingStyle:WJHUDLoadingProgressStyleDeterminate
                             message:message
                              toView:view];
    
}

+ (instancetype)wj_showDeterminateLoading {
    return [self wj_showDeterminateLoading:nil toView:nil];
}



+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style message:(nullable NSString *)message toView:(nullable UIView *)view{
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    if (style == WJHUDLoadingProgressStyleDeterminate) {
        hud.mode = MBProgressHUDModeDeterminate;
    } else if (style == WJHUDLoadingStyleDeterminateHorizontalBar) {
        hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    } else if (style == WJHUDLoadingStyleAnnularDeterminate) {
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    
    if (message) {
        hud.labelText = message;
    }
    
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
    
}

+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style toView:(nullable UIView *)view {
    return [self wj_showLoadingStyle:style message:nil toView:view];
}

+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style {
    return [self wj_showLoadingStyle:style toView:nil];
}




#pragma mark - 显示成功失败信息（打勾打叉动画）

+ (void)wj_showError:(nullable NSString *)error
      hideAfterDelay:(NSTimeInterval)time
              toView:(nullable UIView *)view{
    [self show:error animationType:WJAnimationTypeError hideAfterDelay:time view:view];
    
}

+ (void)wj_showError:(nullable NSString *)error toView:(nullable UIView *)view {
    
//    [self show:error animationType:WJAnimationTypeError view:view];
    [self wj_showError:error hideAfterDelay:1.0 toView:nil];
}

+ (void)wj_showError:(nullable NSString *)error
{
    [self wj_showError:error toView:nil];
}

+ (void)wj_showError{
    [self wj_showError:nil];
}



+ (void)wj_showSuccess:(nullable NSString *)success
        hideAfterDelay:(NSTimeInterval)time
                toView:(nullable UIView *)view{
    [self show:success animationType:WJAnimationTypeSuccess hideAfterDelay:time view:view];
}

+ (void)wj_showSuccess:(nullable NSString *)success toView:(nullable UIView *)view
{
    
//    [self show:success animationType:WJAnimationTypeSuccess view:view];
    [self wj_showSuccess:success hideAfterDelay:1.0 toView:view];

}

+ (void)wj_showSuccess:(nullable NSString *)success
{
    [self wj_showSuccess:success toView:nil];
}

+ (void)wj_showSuccess
{
    [self wj_showSuccess:nil];
}



+ (void)show:(nullable NSString *)text animationType:(WJAnimationType)animationType hideAfterDelay:(NSTimeInterval)time view:(nullable UIView *)view
{
    //    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    //    // 快速显示一个提示信息
    //    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //    hud.labelText = text;
    //    // 设置图片
    //    WJSuccessView *suc = [[WJSuccessView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    //    suc.wj_animationType = animationType;
    //
    //    hud.customView = suc;
    //    // 再设置模式
    //    hud.mode = MBProgressHUDModeCustomView;
    //
    //    // 隐藏时候从父控件中移除
    //    hud.removeFromSuperViewOnHide = YES;
    //
    //    // 1秒之后再消失
    //    [hud hide:YES afterDelay:1.0];
    
    WJSuccessView *suc = [[WJSuccessView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    suc.wj_animationType = animationType;
    [MBProgressHUD wj_showCustomView:suc message:text hideAfterDelay:time toView:view];
}

#pragma mark - 操作成功彩带粒子祝贺HUD

+ (void)wj_showSuccessWithColouredRibbonAnimation:(nullable NSString *)message
                                   hideAfterDelay:(NSTimeInterval)time {
    [self wj_showSuccess:message hideAfterDelay:time toView:nil];
    [WJColouredRibbonAnimation wj_showSuccessColouredRibbonAnimationWithHideTime:time];
}

+ (void)wj_showSuccessWithColouredRibbonAnimation:(nullable NSString *)message {
//    [self wj_showSuccess:message];
//    [WJColouredRibbonAnimation wj_showSuccessColouredRibbonAnimationWithHideTime:1.0];
    [self wj_showSuccessWithColouredRibbonAnimation:message hideAfterDelay:1.0];
    
}

+ (void)wj_showSuccessWithColouredRibbonAnimation {
    [self wj_showSuccessWithColouredRibbonAnimation:nil];
    
}

+ (void)wj_showColouredRibbonAnimationWithHideTime:(NSTimeInterval)time{
    [WJColouredRibbonAnimation wj_showSuccessColouredRibbonAnimationWithHideTime:time];
}



#pragma mark 隐藏HUD

+ (void)wj_hideHUDForView:(nullable UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)wj_hideHUD
{
    [self wj_hideHUDForView:nil];
}


@end
