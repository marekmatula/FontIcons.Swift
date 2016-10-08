# FontIcons

Universal library for Font icons. 
Contains two default implementations:
- [FontAwesome](http://fortawesome.github.io/Font-Awesome/icons/) 4.6.3 
- [VaadinIcons](https://vaadin.com/font-icons) 1.0 
- [MaterialDesignIcons](http://github.com/google/material-design-icons/) 3.0.1 
 

Source code is based on [Font-Awesome-Swift](https://github.com/Vaberer/Font-Awesome-Swift)

Need any other font? Create a issue with details.

[![CI Status](http://img.shields.io/travis/marekmatula/FontIcons.Swift.svg?style=flat)](https://travis-ci.org/marekmatula/FontIcons.Swift)
[![Version](https://img.shields.io/cocoapods/v/FontIcons.svg?style=flat)](http://cocoapods.org/pods/FontIcons)
[![License](https://img.shields.io/cocoapods/l/FontIcons.svg?style=flat)](http://cocoapods.org/pods/FontIcons)
[![Platform](https://img.shields.io/cocoapods/p/FontIcons.svg?style=flat)](http://cocoapods.org/pods/FontIcons)

## Usage
- Use FontIcons 1.1.0 with Swift 2.2
- Use FontIcons 1.2.1 with Swift 2.3
- Use FontIcons 1.3.0 with Swift 3.0

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements
- Xcode 8

## Installation

FontIcons is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the one or more following lines to your Podfile:

```ruby
pod "FontIcons/FontAwesome"
pod "FontIcons/VaadinIcons"
pod "FontIcons/MaterialDesign"
```


Import library in your swift file:

```swift
import FontIcons
```

Set icon with methods 

```Swift
func setFontIcon()
func setFontIconText() 

```

See Extensions.swift for other available methods.
Supported classes are:
```Swift
UIButton, UIBarButtonItem, UILabel, UIImageView, UITabBarItem, UISegmentedControl, UIImage, UISlider
```


## Author

Marek Matula, marek.matula@gmail.com

## License

FontIcons is available under the MIT license. See the LICENSE file for more info.
FontFiles have own licenses:
- [VaadinIcons license](https://vaadin.com/font-icons/license)
- [FontAwesome license](http://fortawesome.github.io/Font-Awesome/license/)
- [MaterialDesignIcons license](https://github.com/google/material-design-icons/)

