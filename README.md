# MBProgressHUD+WJExtension
基于 MBProgressHUD 的封装，方便使用，并增加了操作成功与失败的HUD动画。



# 效果演示

> 使用过程中可以不显示下方的文字。比如加载进度条，可以不显示文字信息，只显示加载控件。Demo 只是其中的一个演示而已。主要方法请参考`MBProgressHUD+WJExtension.h`头文件

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

  - 详细案例请查看`demo`



# 自定义View须知

本扩展是基于 `MBProgressHUD`封装，自定义的`View`指的是如下图中的红框部分。自定义的`View`将显示在红框那个位置

 ![Snip20170607_2](resource/Snip20170607_2.png)