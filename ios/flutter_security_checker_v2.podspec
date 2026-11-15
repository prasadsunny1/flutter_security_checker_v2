#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_security_checker_v2'
  s.version          = '3.3.0'
  s.summary          = 'Root/jailbreak and integrity checks. Fork of flutter_security_checker with Swift Package Manager support.'
  s.description      = <<-DESC
Verifies rooting and integrity on Android and iOS. Fork of Dev-hwang/flutter_security_checker with Swift Package Manager support.
                       DESC
  s.homepage         = 'https://github.com/Dev-hwang/flutter_security_checker'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Dev-hwang' => 'https://github.com/Dev-hwang' }
  s.source           = { :path => '.' }
  s.source_files     = 'flutter_security_checker_v2/Sources/flutter_security_checker_v2/**/*.{h,m}'
  s.public_header_files = 'flutter_security_checker_v2/Sources/flutter_security_checker_v2/include/**/*.h'
  s.dependency 'Flutter'
  s.ios.deployment_target = '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
