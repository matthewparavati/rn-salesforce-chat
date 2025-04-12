require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "rn-salesforce-chat"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :ios, "14.0"
  s.source       = { :git => "https://github.com/matthewparavati/rn-salesforce-chat.git", :tag => "#{s.version}" }

  s.source_files  = "ios/RNSalesforceChat.{h,m}"

  s.dependency "React-Core"
  s.dependency 'ServiceSDK/Chat', '~> 246.0.1'
  
  # Disable bitcode
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  s.user_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
end
