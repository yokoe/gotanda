#
# Be sure to run `pod lib lint Gotanda.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Gotanda"
  s.version          = "0.0.5"
  s.summary          = "A lightweight bitmap manipulation library for iOS / macOS."

  s.description      = <<-DESC
A lightweight bitmap manipulation library for Swift.
Creates NSImage / UIImage instantly.
                       DESC

  s.homepage         = "https://github.com/yokoe/Gotanda"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Sota Yokoe" => "info@kreuz45.com" }
  s.source           = { :git => "https://github.com/yokoe/Gotanda.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/croquette0212'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = "Sources/**/*.{h,swift}"

  s.xcconfig = {
    'SWIFT_VERSION' => '3'
  }
end
