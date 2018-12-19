Pod::Spec.new do |s|
  s.name = "MapPin"
  s.version = "1.0.0"
  s.summary = "MapPin lets a user to generate map pin."
  s.homepage = "https://github.com/iOSHVN/MapPin"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.authors = "Hiral Naik"
  s.ios.deployment_target = "12.0"
  s.source = { :git => "https://github.com/iOSHVN/MapPin.git", :tag => "v#{s.version}" }
  s.source_files = "MapPin/**/*.{swift,h,m}"
  s.swift_version = '4.2'
  s.cocoapods_version = '>= 1.5.3'
end
