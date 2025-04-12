require 'json'
package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.authors      = package['author']
  s.platforms    = { :ios => '14.0' }
  s.source       = { :git => package['repository']['url'], :tag => "#{s.version}" }

  s.source       = { :git => "https://github.com/matthewparavati/rn-salesforce-chat", :tag => "v#{s.version}" }
  s.source_files = 'ios/**/*.{h,m,mm,swift}'

  s.dependency 'React'
  s.dependency 'ServiceSDK/Chat', '~> 234.1.0'

  # Explicitly disable bitcode
  s.pod_target_xcconfig = {
    'ENABLE_BITCODE' => 'NO',
    'BITCODE_GENERATION_MODE' => 'none',
    'OTHER_LDFLAGS' => '-ObjC'
  }

  # Ensure all frameworks also have bitcode disabled
  s.user_target_xcconfig = {
    'ENABLE_BITCODE' => 'NO',
    'BITCODE_GENERATION_MODE' => 'none'
  }
end
