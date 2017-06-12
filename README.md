# MBProgressHUD+WJExtension
基于 MBProgressHUD 的封装，方便使用，并增加了操作成功与失败的HUD动画与祝贺撒花效果。



# 效果演示

> 使用过程中可以不显示下方的文字。比如加载进度条，可以不显示文字信息，只显示加载控件。Demo 只是其中的一个演示而已。注意的是：本扩展中加载菊花是不会自动消失的，需要手动调用隐藏移除方法。主要方法请参考`MBProgressHUD+WJExtension.h`头文件

 ![demo](resource/demo.gif)





# 安装

- 一、可以下载当前项目，将项目中的`MBProgressHUD+WJExtension`文件夹拖入您的工程中即可

- 二、通过 `Cocoapods`方式：`pod 'MBProgressHUD+WJExtension'`

  ​

# 开始使用

- 导入头文件

```objc
#import "MBProgressHUD+WJExtension.h"
```

- 根据需求展示各式的 HUD

  - 详细的方法列表请查看`MBProgressHUD+WJExtension.h`头文件

     方法列表如下：![Snip20170607_1](resource/Snip20170607_1.png)




## 加载进度的HUD使用说明

**以开扇型类型的加载进度为例：**

可使用的方法列表如下：

```objc
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

/**
 加载进度的HUD，设置HUD的progress请通过 HUD 对象调用 showAnimated: whileExecutingBlock: 等方法
 
 @param style 进度条样式(横条、环形、开扇型三种)
 @param message 消息正文，传nil不显示
 @param view 展示的View
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style
                            message:(nullable NSString *)message
                             toView:(nullable UIView *)view;

+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style toView:(nullable UIView *)view;

+ (instancetype)wj_showLoadingStyle:(WJHUDLoadingProgressStyle)style;
```

可以注意到，每个方法的调用都会将 `MBProgressHUD`对象返回出来。我们可以通过返回回来的对象去调用 MBProgressHUD 中的属性。比如 progress，以便我们去设置加载进度....。如以下举例：

```objc
		// 展示HUD
		MBProgressHUD *hud = [MBProgressHUD wj_showLoadingStyle:WJHUDLoadingProgressStyleDeterminate message:@"正在加载..." toView:nil];
        
        // 在获取到进度信息的地方设置HUD的progress，这里只是一个模拟
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
        }];

```








# 自定义View须知

本扩展是基于 `MBProgressHUD`封装，自定义的`View`指的是如下图中的红框部分。自定义的`View`将显示在红框那个位置



 ![Snip20170607_2](resource/Snip20170607_2.png)



# 关于搜索不到框架的问题



如果 `pod search MBProgressHUD+WJExtension`搜索不到当前扩展，需要你手动清除缓存

 ![Snip20170608_3](resource/Snip20170608_3.png)



然后再重新搜索`pod search MBProgressHUD+WJExtension`即可，在这个过程中，会自动创建新的索引文件。



































