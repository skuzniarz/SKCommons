Pod::Spec.new do |s|
  s.name         = "SKCommons"
  s.version      = "0.1.2"
  s.summary      = "Some handy helper classes."
  s.description  = <<-DESC
                    Some handy helper classes.
                   DESC
  s.homepage     = "http://theusefulpot.blogspot.com/"
  s.license      = 'MIT'
  s.author       = { "Szczepan Kuzniarz" => "szczepan.kuzniarz@gmail.com" }
  s.source       = { :git => "https://github.com/skuzniarz/SKCommons.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.public_header_files = 'SKQueues.h'
end
