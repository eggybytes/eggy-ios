# 🥚 eggy-ios

Welcome to the [eggy](https://useeggy.com) iOS SDK!

Check out our [official documentation](https://docs.useeggy.com/client-side-sdks/ios-sdk-reference) for in-depth information on installing and using eggy on iOS.

[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-6175DE.svg?style=flat)](https://swift.org/package-manager/)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/eggy-ios.svg)](https://cocoapods.org/pods/eggy-ios)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-6175DE.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Bazel compatible](https://img.shields.io/badge/Bazel-compatible-6175DE.svg?style=flat)](https://bazel.build/)
[![Platform](https://img.shields.io/cocoapods/p/eggy-ios.svg?style=flat)](https://docs.useeggy.com/client-side-sdks/ios-sdk-reference)

- [Install](#installation)
  - [If you use Swift Package Manager](#if-you-use-swift-package-manager)
  - [If you use CocoaPods](#if-you-use-cocoapods)
  - [If you use Carthage](#if-you-use-carthage)
  - [If you use Bazel](#if-you-use-bazel)
  - [If you'd rather install this library manually](#if-youd-rather-install-this-library-manually)
- [Hook up push notifications](#hook-up-push-notifications)
  - [If you want to integrate EggyNotificationServiceExtension](#integrate-eggynotificationserviceextension)
- [Demo applications and example code](#demo-applications-and-example-code)
- [Learn more](#learn-more)

## Swift and Objective-C compatibility

The eggy SDK for iOS is written in Swift, and is compatible with applications written in either Swift or Objective-C. See inline code samples throughout the documentation for use with either language.

## Install

We support multiple methods for installing the `eggy-ios` library in a project. Once installed, head over to the [SDK documentation](https://docs.useeggy.com/client-side-sdks/ios-sdk-reference) for complete instructions on getting started with using the SDK.

### If you use Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a dependency manager integrated into the `swift` compiler and Xcode.

To integrate `eggy-ios` into an Xcode project, go to the project editor, and select `Swift Packages`. From here hit the `+` button and follow the prompts using  `https://github.com/eggybytes/eggy-ios.git` as the URL.

To include `eggy-ios` in a Swift package, simply add it to the dependencies section of your `Package.swift` file, and add the product "eggy-ios" as a dependency for your targets.

```swift
dependencies: [
    .package(url: "https://github.com/eggybytes/eggy-ios.git", .upToNextMinor(from: "1.0.2"))
]
```

### If you use CocoaPods

To use the [CocoaPods](https://cocoapods.org) dependency manager to integrate `eggy-ios` into your Xcode project, specify it in your `Podfile`:

```ruby
use_frameworks!
target 'YourTargetName' do
  pod 'eggy-ios', '~> 1.0.2'
end
```

### If you use Carthage

To use the [Carthage](https://github.com/Carthage/Carthage) dependency manager to integrate `eggy-ios` into your Xcode project, specify it in your `Cartfile`:

```ogdl
github "eggybytes/eggy-ios" ~> 1.0.2
```

### If you use Bazel

### If you'd rather install this library manually

If you prefer not to use the aforementioned dependency managers, it is possible to integrate the SDK manually.

1. On the root folder of the project retreive the SDK by either:
    * Adding the SDK as a git submodule with `git submodule add https://github.com/eggybytes/eggy-ios.git`.
    * OR cloning the SDK with `git clone https://github.com/eggybytes/ieggy-ios.git`.
2. Open the new `eggy-ios` folder and drag `eggy-ios.xcodeproj` into the project navigator of your application's Xcode project. It should appear nested within your application's blue project icon.
3. Select your application project in the project navigator (blue icon) and select your application target under the "Targets" heading in the sidebar. If you have multiple targets, perform the following steps for each target. 
4. Select the "General" tab, and if necessary expand the subsection "Frameworks, Libraries, and Embedded Content".
5. Click the "+" button in the expanded subsection. Under "eggy-ios" within the dialog, select `eggy_ios.framework`.


## Learn more
 
Check out our [documentation](https://docs.useeggy.com) for in-depth instructions on configuring and using eggy. You can also head straight to the [complete reference guide for this SDK](https://docs.useeggy.com/client-side-sdks/ios-sdk-reference).
