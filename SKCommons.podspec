#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "SKCommons"
  s.version      = "0.1.0"
  s.summary      = "Some handy helper classes."
  s.description  = <<-DESC
                    Some handy helper classes.
                   DESC
  # s.homepage     = ""
  # s.screenshots  = "", ""
  s.license      = 'MIT'
  s.author       = { "Szczepan Kuzniarz" => "szczepan.kuzniarz@gmail.com" }
  s.source       = { :git => "https://github.com/skuzniarz/SKCommons.git", :tag => s.version.to_s }

  # s.platform     = :ios, '5.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
