
Pod::Spec.new do |s|

s.name         = "TSTransitionKit"
s.version      = "1.0.6"
s.summary      = "A Lib For Transition."
s.description  = <<-DESC
TSTransitionKit是一个综合类的Transition工具类。
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/TSTransitionKit"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.requires_arc = true

s.frameworks = 'UIKit', 'Foundation'

s.source = { :git => "https://github.com/StoneStoneStoneWang/TSTransitionKit.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{h,m}"

s.dependency 'TS_BaseViewController'

end

