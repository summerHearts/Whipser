#
# Be sure to run `pod lib lint Whisper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Whisper'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Whisper.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/summerhearts@163.com/Whisper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'summerhearts@163.com' => 'summerhearts@163.com' }
  s.source           = { :git => 'https://github.com/summerhearts@163.com/Whisper.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'


  s.subspec 'Core' do |s|
      s.source_files = 'Whisper/Classes/Core/**/**'
      s.public_header_files = 'Pod/Classes/Core/*.h'
  end
  
  s.subspec 'Extensions' do |ext|
      ext.source_files = 'Whisper/Classes/ggml/ggml.c'
      ext.compiler_flags = '-DGGML_USE_ACCELERATE -DGGML_USE_METAL' # 为 Extensions subspec 设置不同的编译器标志
  end
  
  s.subspec 'Metal' do |ext|
      ext.source_files = 'Whisper/Classes/ggml-metal/ggml-metal.m'
      ext.compiler_flags = '-framework Foundation -framework Metal -framework MetalKit -fno-objc-arc' # 为 Extensions subspec 设置不同的编译器标志
  end
end
