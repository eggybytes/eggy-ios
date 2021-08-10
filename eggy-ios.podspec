# coding: utf-8
Pod::Spec.new do |s|
  s.name             = 'eggy-ios'
  s.version          = '1.0.7'
  s.summary          = 'iOS SDK for eggy'

  s.description      = <<-DESC
iOS SDK for eggy: a simple, fast, and reliable service for delivering push notifications.
                       DESC

  s.homepage         = 'https://github.com/eggybytes/eggy-ios'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE.txt' }
  s.author           = { 'eggy' => 'hello@useeggy.com' }
  s.source           = { :git => 'https://github.com/eggybytes/eggy-ios.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/useeggy'

  s.ios.deployment_target = '9.0'

  s.source_files = 'eggy-ios/Classes/**/*'
  s.swift_version = '5.0'
end
