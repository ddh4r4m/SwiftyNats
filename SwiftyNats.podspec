#
#  Be sure to run `pod spec lint SwiftyNats.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SwiftyNats"
  spec.version      = "0.0.3"
  spec.summary      = "A Swift client for NATS messaging system."

  spec.description  = <<-DESC
                        SwiftyNats is a lightweight Swift client for connecting to NATS servers. 
                       It supports publishing and subscribing to topics in a straightforward and efficient manner.
                      DESC

  spec.homepage     = "https://github.com/ddh4r4m/SwiftyNats"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = { :type => "Unlicense", :file => "LICENSE" }

  spec.author             = { "Dharam Dhurandhar" => "ddh4r4m@gmail.com" }
  # Or just: spec.author    = "Dharam Dhurandhar"
  # spec.authors            = { "Dharam Dhurandhar" => "dharamdhurandhar@Dharams-MacBook-Pro.local" }
  # spec.social_media_url   = "https://twitter.com/Dharam Dhurandhar"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
  spec.platform = :ios, "17.0"

  #  When using multiple platforms
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/ddh4r4m/SwiftyNats.git", :tag => "#{spec.version}" }


  # spec.source_files  = "SwiftyNats/SwiftyNats/**/*.{h,m,swift}"
  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.source_files = "Sources/**/*.{h,m,swift}"
  spec.exclude_files = "Tests/**/*"

  # spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  # spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  # Swift version compatibility
  spec.swift_versions = ['5.7']


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
  spec.dependency 'SwiftNIO', '~> 2.40.0' # Adjust the version as needed
  spec.dependency 'Logging', '~> 1.4.0' # Adjust the version as needed
end
