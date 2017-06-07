//
//  WJSuccessView.h
//  WJTool
//
//  Created by 陈威杰 on 2017/6/3.
//  Copyright © 2017年 ChenWeiJie. All rights reserved.
//
//----------------------------------------------------
//              打勾、打叉动画
//----------------------------------------------------

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WJAnimationType) {
    WJAnimationTypeNone,
    /* 成功 */
    WJAnimationTypeSuccess,
    /* 失败 */
    WJAnimationTypeError,
};

@interface WJSuccessView : UIView<CAAnimationDelegate>

/**
 *  操作成功还是失败类型的动画
 */
@property(nonatomic, assign) WJAnimationType wj_animationType;

@end

NS_ASSUME_NONNULL_END
