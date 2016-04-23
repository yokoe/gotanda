# Gotanda

[![CI Status](http://img.shields.io/travis/SotaYokoe/Gotanda.svg?style=flat)](https://travis-ci.org/SotaYokoe/Gotanda)
[![Version](https://img.shields.io/cocoapods/v/Gotanda.svg?style=flat)](http://cocoapods.org/pods/Gotanda)
[![License](https://img.shields.io/cocoapods/l/Gotanda.svg?style=flat)](http://cocoapods.org/pods/Gotanda)
[![Platform](https://img.shields.io/cocoapods/p/Gotanda.svg?style=flat)](http://cocoapods.org/pods/Gotanda)

## Usage

```
let imageRep = Gotanda(width: 300, height: 200, backgroundColor: NSColor.yellowColor().CGColor).draw { (context) in
    // Draw something using context
}.imageRep

if let pngData = imageRep.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:]) {
    // Save PNG data.
}
```

## Requirements

## Installation

Gotanda is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Gotanda"
```

## Author

Sota Yokoe, info@kreuz45.com

## License

Gotanda is available under the MIT license. See the LICENSE file for more info.
