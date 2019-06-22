#
# Be sure to run `pod lib lint WeatherLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WeatherLib'
  s.version          = '0.1.10'
  s.summary          = 'A short description of WeatherLib.'

  s.description      = 'Long description'

s.subspec 'Logging' do |sp|
sp.source_files = 'VolvoCommon/Logging/**/*'
end

s.subspec 'Keychain' do |sp|
sp.source_files = 'VolvoCommon/Keychain/**/*'
end

s.subspec 'ImageCache' do |sp|
sp.source_files = 'VolvoCommon/ImageCache/**/*'
end

s.subspec 'Units' do |sp|
sp.source_files = 'VolvoCommon/Units/**/*'
end

s.subspec 'Cryptography' do |sp|
sp.source_files = 'VolvoCommon/Cryptography/**/*'
end

s.subspec 'Localization' do |sp|
sp.source_files = 'VolvoCommon/Localization/**/*'
end

s.subspec 'Models' do |sp|
    sp.source_files = 'VolvoCommon/Models/**/*'
end

  s.homepage         = 'https://gitlab.cm.volvocars.biz/MA/vcc-common-ios'
  s.license          = 'All rights reserved (c) 2017 Volvo Car Corporation'
  s.author           = { 'Fredrik Jonazon' => 'fredrik.jonazon@volvocars.com' }
  s.source           = { :git => 'https://gitlab.cm.volvocars.biz/MA/vcc-common-ios', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.watchos.deployment_target = '4.3'
  s.tvos.deployment_target = '10.0'
#s.source_files = 'VolvoCommon/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VolvoCommon' => ['VolvoCommon/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
