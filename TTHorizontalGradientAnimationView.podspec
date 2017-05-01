#
# Be sure to run `pod lib lint TTHorizontalGradientAnimationView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TTHorizontalGradientAnimationView'
  s.version          = '0.1.1'
  s.summary          = 'A horizontal colorful gradient animation to indicate indeterminate progress based on CAGradientLayer'


  s.description      = <<-DESC
 A multi-hued drop in UIView animation
   * Drop it anywhere you want, size it according to your needs
   * View automatically animates
   * Remove it from your view hierarchy when you're done
                       DESC

  s.homepage         = 'https://github.com/dhiraj/TTHorizontalGradientAnimationView'
  s.screenshots     = 'https://raw.githubusercontent.com/dhiraj/TTHorizontalGradientAnimationView/develop/Screenshots/TTHorizontalGradientAnimationView.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dhiraj' => 'development@traversient.com' }
  s.source           = { :git => 'https://github.com/dhiraj/TTHorizontalGradientAnimationView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dhiraj'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TTHorizontalGradientAnimationView/Classes/**/*'
  

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
