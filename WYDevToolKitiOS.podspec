Pod::Spec.new do |s|
  s.name         = "WYDevToolKitiOS" # 项目名称
  s.version      = "0.1.0"        # 版本号 与 你仓库的 标签号 对应
  s.license      = "MIT"          # 开源证书
  s.summary      = "iOS开发基础工具集成" # 项目简介
  s.description  = <<-DESC
  
  # 使用方法
```
pod 'WYDevToolKitiOS'
```
```
$ pod install
```

直接导入即可
```
#import <WYDevToolKitiOS/WYDevToolKit.h>
```
                    DESC
 
  s.homepage     = "https://github.com/WangYyyyy/WYDevToolKitiOS" # 你的主页
  s.source       = { :git => "https://github.com/WangYyyyy/WYDevToolKitiOS.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
  s.source_files = "WYDevToolKit/**/*.{h,m}" # 你代码的位置， BYPhoneNumTF/*.{h,m} 表示 BYPhoneNumTF 文件夹下所有的.h和.m文件
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "8.0" #平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" #支持的框架
  # s.dependency   = "AFNetworking" # 依赖库
  
  # User
  s.author             = { "wangyu" => "5877156@qq.com" }
  # s.social_media_url   = "http://qiubaiying.github.io" # 个人主页
 end
