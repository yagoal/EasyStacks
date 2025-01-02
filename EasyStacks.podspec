Pod::Spec.new do |s|
  s.name             = 'EasyStacks'
  s.version          = '1.0.0'
  s.summary          = 'A framework to simplify working with stacks and constraints in UIKit.'
  s.description      = 'EasyStacks is a framework that simplifies creating stack-based layouts and constraints in UIKit.'
  s.homepage         = 'https://your-repo-url.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yago Augusto' => 'br.yago@gmail.com' }
  s.platform         = :ios, '12.0'
  s.source           = { :path => '.' }

  s.source_files     = 'Sources/**/*.{swift}'
end