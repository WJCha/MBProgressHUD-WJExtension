Pod::Spec.new do |s|

s.name         = "MBProgressHUD+WJExtension"
s.version      = "1.3.1"
s.summary      = "基于MBProgressHUD进行封装，方便使用，并增加操作成功失败的动画"

s.description  = <<-DESC
1、使用简便
2、基于MBProgressHUD 0.9.2 版本封装
3、增加操作成功失败的动画
4、增加祝贺类弹框可以所需的碎花粒子动画效果
4、具体可以参见MBProgressHUD+WJExtension.h头文件
DESC

s.homepage     = "https://github.com/WJCha/MBProgressHUD-WJExtension"
s.license      = "MIT"

s.author       = { "WJCha" => "weejie_chen@icloud.com" }
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/WJCha/MBProgressHUD-WJExtension.git", :tag => s.version }
s.source_files  = "MBProgressHUD+WJExtension/*"
s.requires_arc = true
end
