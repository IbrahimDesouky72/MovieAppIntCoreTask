# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'

target 'MovieProject' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
pod 'Alamofire', '~> 4.7'
pod 'SDWebImage', '~> 4.0'
pod 'lottie-ios'
pod 'Cosmos', '~> 15.0'
pod 'CarbonKit'

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

  

end
