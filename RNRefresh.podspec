require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name          = "RNRefresh"
  s.version       = package['version']
  s.summary       = package['description']
  s.authors       = package['author']
  s.homepage      = package['homepage']
  s.license       = package['license']
  s.platform      = :ios, "11.0"
  s.framework     = 'UIKit'
  s.requires_arc  = true
  s.source        = { :git => "https://github.com/uninterested/react-native-refresh.git" }
  s.source_files  = "ios/**/*.{h,m}"

  s.dependency 'React'
  s.dependency 'MJRefresh', '~> 3.5.0'
end