Pod::Spec.new do |s|
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "MapPin"
s.summary = "MapPin lets a user to generate map pin."
s.requires_arc = true
s.version = "1.0.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Hiral Naik" => "hrlnaik@gmail.com" }
s.homepage = "https://github.com/iOSHVN/MapPin"
s.source = { :git => "https://github.com/iOSHVN/MapPin.git" }
s.framework = "UIKit"
s.source_files = "MapPin/**/*.{swift}"
s.resources = "MapPin/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
s.swift_version = "4.2"
end
