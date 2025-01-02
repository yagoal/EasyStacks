Pod::Spec.new do |s|
  s.name             = 'EasyStacks'
  s.version          = '1.0.2'
  s.summary          = 'A framework to simplify working with stacks and constraints in UIKit.'
  s.description      = <<-DESC
    EasyStacks is a framework that simplifies creating stack-based layouts 
    and constraints in UIKit, helping developers minimize the usage of manual constraints.
  DESC
  s.homepage         = 'https://github.com/yagoal/EasyStacks'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yago Augusto' => 'br.yago@gmail.com' }
  s.platform         = :ios, '12.0'
  s.source = { :git => 'https://github.com/yagoal/EasyStacks.git', :tag => s.version.to_s }
  s.source_files     = 'Sources/**/*.{swift}'

  s.dependency 'SnapKit', '~> 5.7.1'
  s.swift_versions   = ['5.7']
end