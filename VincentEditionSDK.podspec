Pod::Spec.new do |spec|
  spec.name         = "VincentEditionSDK"
  spec.version      = "1.0.0"
  spec.summary      = "VincentEditionSDK"

  spec.source   = { :git => 'https://github.com/Vincent1Kim/VincentEditionSDK.git', :tag => spec.version }
  spec.license = { :type => 'Copyright', :text => <<-LICENSE
                 Copyright 2021
                 Permission is granted to...
                 LICENSE
              }

  spec.author             = { "VincentEditionSDK" => "vincent@shoplive.cloud" }
  spec.platform     = :ios
  spec.ios.deployment_target = '11.0'
  spec.swift_version = "5"
  spec.vendored_frameworks = 'Frameworks/VincentEditionSDK.xcframework'

end
