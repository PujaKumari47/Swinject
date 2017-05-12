# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Swinjectpoc' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Swinjectpoc
  pod 'Alamofire', '~> 4.4'
  pod 'RxSwift',    '~> 3.0'
  pod 'SwiftyJSON', '3.0.0'
  pod 'Swinject', '~> 2.0.0'
  pod 'SwinjectStoryboard', '1.0.0'
 

  target 'SwinjectpocTests' do
    inherit! :search_paths
    # Pods for testing
 
  end

  target 'SwinjectpocUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
