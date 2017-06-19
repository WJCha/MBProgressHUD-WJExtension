//
//  MBProgressHUD+WJExtension.h
//  WJTool
//
//  Created by 陈威杰 on 2017/6/2.
//  Copyright © 2017年 ChenWeiJie. All rights reserved.
//
//----------------------------------------------------------------------------------
//  1、基于 MBProgressHUD 0.9.2版本封装（支持横竖屏），增加了操作成功、失败的打勾打叉动画，
//    以及提供了一种可能适用于祝贺类的弹框提示所需的撒花（碎花粒子效果）效果，可酌情使用。
//    当前扩展的 GitHub 地址：https://github.com/WJCha/MBProgressHUD-WJExtension
//  2、当前版本：1.2.0
//  3、如果在使用过程中有问题或者建议可以随时联系我：weejie_chen@icloud.com 或者 GitHub issue
//
//  4、更新日志：
//  版本：1.2.0 --> 增加撒花祝贺效果，修改打勾打叉动画时长
//  2017.6.19 版本：1.3.1 --> 增加设置HUD展示时长的方法
//----------------------------------------------------------------------------------


#import "MBProgressHUD.h"

// 过期提示
#define WJExtensionDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)
#define WJAttributeDeprecated(instead) __attribute__((deprecated(instead)))

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WJHUDLoadingProgressStyle) {
    /* 开扇型加载进度 */
    WJHUDLoadingProgressStyleDeterminate,
    /* 横条加载进度 */
    WJHUDLoadingStyleDeterminateHorizontalBar,
    /* 环形加载进度 */
    WJHUDLoadingStyleAnnularDeterminate,
};

@interface MBProgressHUD (WJExtension)


#pragma mark - 显示纯文本信息
/**
 只显示纯文本信息, 默认 1 秒后消失
 */
+ (void)wj_showText:(NSString *)text view:(nullable UIView *)view WJAttributeDeprecated("使用 wj_showPlainText:view:方法");

/**
 只显示纯文本信息, 默认 1 秒后消失

 @param text 消息文本
 @param view 展示的View
 */
+ (void)wj_showPlainText:(NSString *)text view:(nullable UIView *)view;


/**
 只显示纯文本信息

 @param text 消息文本
 @param time HUD展示时长
 @param view 展示的View
 */
+ (void)wj_showPlainText:(NSString *)text
          hideAfterDelay:(NSTimeInterval)time
                    view:(nullable UIView *)view;


#pragma mark - 显示操作成功或失败信息（自定义view打勾打叉动画）

/**
 显示失败信息，同时有打叉的动画
 
 @param error 错误信息
 @param time HUD展示时长
 @param view 展示的view
 */
+ (void)wj_showError:(nullable NSString *)error
      hideAfterDelay:(NSTimeInterval)time
              toView:(nullable UIView *)view;

/**
 显示失败信息，同时有打叉的动画, 默认 1 秒后消失

 @param error 错误信息提示文本
 @param view 展示的View
 */
+ (void)wj_showError:(nullable NSString *)error toView:(nullable UIView *)view;



/**
 显示失败信息，同时有打叉的动画，默认 1 秒后消失

 @param error 错误信息提示文本
 */
+ (void)wj_showError:(nullable NSString *)error;

/**
 只显示打叉动画HUD，默认 1 秒后消失
 */
+ (void)wj_showError;



/**
 显示成功信息，同时会有一个打勾的动画

 @param success 成功信息提示文本
 @param time HUD展示时长
 @param view 展示的View
 */
+ (void)wj_showSuccess:(nullable NSString *)success
      hideAfterDelay:(NSTimeInterval)time
              toView:(nullable UIView *)view;

/**
 显示成功信息，同时会有一个打勾的动画, 默认 1s 后消失

 @param success 成功信息提示文本
 @param view 展示的View
 */
+ (void)wj_showSuccess:(nullable NSString *)success toView:(nullable UIView *)view;
/**
 显示成功信息，同时会有一个打勾的动画, 默认 1s 后消失
 
 @param success 成功信息提示文本
 */
+ (void)wj_showSuccess:(nullable NSString *)success;

/**
 只显示打勾动画HUD，默认 1s 后消失
 */
+ (void)wj_showSuccess;



#pragma mark - 操作成功 & 彩带粒子碎花祝贺HUD效果

/**
 显示操作成功HUD的同时伴随碎花粒子动画效果，可用于祝贺的场景

 @param message 祝贺消息
 @param time HUD展示时长
 */
+ (void)wj_showSuccessWithColouredRibbonAnimation:(nullable NSString *)message
                        hideAfterDelay:(NSTimeInterval)time;

/**
 显示操作成功HUD的同时伴随碎花粒子动画效果，可用于祝贺的场景, 默认 1s 后消失

 @param message 祝贺消息
 */
+ (void)wj_showSuccessWithColouredRibbonAnimation:(nullable NSString *)message;


/**
 显示操作成功HUD的同时伴随碎花粒子动画效果，可用于祝贺的场景， 默认 1s 后消失
 */
+ (void)wj_showSuccessWithColouredRibbonAnimation;

#pragma mark - 自行调用彩带粒子碎花效果方法
/**
 显示碎花粒子效果
 */
+ (void)wj_showColouredRibbonAnimationWithHideTime:(NSTimeInterval)time;






#pragma mark - 自己设置提示信息的 图标

/**
 显示带有自定义icon图标消息HUD

 @param icon 图标
 @param message 消息正文
 @param time HUD展示时长
 @param view 展示的view
 */
+ (void)wj_showIcon:(UIImage *)icon
            message:(NSString *)message
     hideAfterDelay:(NSTimeInterval)time
               view:(nullable UIView *)view;

/**
 显示带有自定义icon图标消息HUD, 默认 1s 后消失

 @param icon 图标
 @param message 消息正文
 @param view 展示的view
 */
+ (void)wj_showIcon:(UIImage *)icon
            message:(NSString *)message
               view:(nullable UIView *)view;

+ (void)wj_showIcon:(UIImage *)icon message:(NSString *)message;


#pragma mark - 有加载进度的HUD


/**
 显示菊花加载状态，不会自动消失，需要在你需要移除的时候调用 wj_hideHUDForView: 等移除方法

 @param message 消息正文
 @param view 展示的view
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showActivityLoading:(nullable NSString *)message
                                toView:(nullable UIView *)view;

/**
 只显示菊花加载动画，不会自动消失，需要在你需要移除的时候调用 wj_hideHUDForView: 等移除方法

 @param view 展示的View
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showActivityLoadingToView:(nullable UIView *)view;
/**
 只显示菊花加载动画，不会自动消失，需要在你需要移除的时候调用 wj_hideHUDForView: 等移除方法
 
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showActivityLoading;


/**
 加载进度的HUD，设置HUD的progress请通过 HUD 对象调用 showAnimated: whileExecutingBlock: 等方法
 
 使用举例：
 MBProgressHUD *hud = [MBProgressHUD wj_showLoadingStyle:WJHUDLoadingProgressStyleDeterminate message:@"正在加载..." toView:nil];
 [hud showAnimated:YES whileExecutingBlock:^{
     float progress = 0.0f;
     while (progress < 1.0f) {
        hud.progress = progress;
        hud.labelText = [NSString stringWithFormat:@"正在加载...%.0f%%", progress * 100];
        progress += 0.01f;
        usleep(50000);
     }
 } completionBlock:^{
    [MBProgressHUD wj_hideHUD];
 // [hud removeFromSuperViewOnHide];
 }];
 
 @param style 进度条样式
 @param message 消息正文，传nil不显示
 @param view 展示的View
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style
                            message:(nullable NSString *)message
                             toView:(nullable UIView *)view;

/**
 只显示加载进度的HUD，不显示消息文本，设置HUD的progress请通过 HUD 对象调用 showAnimated: whileExecutingBlock: 等方法

 @param style 进度条样式
 @param view 展示的View
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style toView:(nullable UIView *)view;

/**
 只显示加载进度的HUD，不显示消息文本，设置HUD的progress请通过 HUD 对象调用 showAnimated: whileExecutingBlock: 等方法

 @param style 进度条样式
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style;



/**
 显示环形加载状态指示器

 @param message 消息正文，传nil不显示
 @param view 展示的View
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showAnnularLoading:(nullable NSString *)message
                               toView:(nullable UIView *)view;

/**
 只显示环形加载状态指示器，不显示文本消息

 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showAnnularLoading;

/**
 扇形饼状加载进度
 
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showDeterminateLoading:(nullable NSString *)message
                                   toView:(nullable UIView *)view;

/**
 只显示扇形饼状加载进度指示器，不显示文本消息

 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showDeterminateLoading;



#pragma mark - 自定义HUD中显示的view

/**
 自定义HUD中显示的view

 @param customView 自定义的view
 @param message 消息正文，传nil只显示自定义的view在HUD上
 @param time HUD展示时长
 @param view 展示的view
 */
+ (void)wj_showCustomView:(UIView *)customView
                  message:(nullable NSString *)message
           hideAfterDelay:(NSTimeInterval)time
                     toView:(nullable UIView *)view;

+ (void)wj_showCustomView:(UIView *)customView
           hideAfterDelay:(NSTimeInterval)time
                     toView:(nullable UIView *)view;

+ (void)wj_showCustomView:(UIView *)customView
           hideAfterDelay:(NSTimeInterval)time;

/**
 自定义HUD中显示的view, 闭包返回自定义的View

 @param message 消息正文
 @param time HUD展示时长
 @param view 展示的view
 @param customView 返回自定义UIView
 */
+ (void)wj_showMessage:(nullable NSString *)message
        hideAfterDelay:(NSTimeInterval)time
                toView:(nullable UIView *)view
            customView:(UIView *(^)())customView;

+ (void)wj_showHideAfterDelay:(NSTimeInterval)time
                   customView:(UIView *(^)())customView;



#pragma mark - 移除HUD
/**
 从view上移除HUD

 @param view 展示HUD的View
 */
+ (void)wj_hideHUDForView:(nullable UIView *)view;
/**
 从当前展示的View上移除HUD
 */
+ (void)wj_hideHUD;


@end

NS_ASSUME_NONNULL_END
