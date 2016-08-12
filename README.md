<p align = "center">
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![Pod Version](https://cocoapod-badges.herokuapp.com/v/AvatarImageView/badge.png)](https://cocoapods.org/pods/SwiftLogger)
[![Swift Version](https://img.shields.io/badge/Language-Swift%202.2-orange.svg)](https://developer.apple.com/swift)
<p>

#### Build Status
Develop: [![Build Status](https://travis-ci.org/ayushn21/AvatarImageView.svg?branch=develop)](https://travis-ci.org/ayushn21/AvatarImageView)

Master: [![Build Status](https://travis-ci.org/ayushn21/AvatarImageView.svg?branch=master)](https://travis-ci.org/ayushn21/AvatarImageView)

## Description

`AvatarImageView` is a customisable subclass of UIImageView that is designed to show users' profile pictures. It falls back to the user's initials with a random background color if no profile picture is supplied.

This library was inspired by and is supposed to be a Swift rewrite of [bachonk/UIImageView-Letters](https://github.com/bachonk/UIImageView-Letters). 

##Usage

To set up `AvatarImageView`, a `dataSource` that conforms to `AvatarImageViewDataSource` needs to be set. Optionally a `configuration` that conforms to `AvatarImageViewConfiguration` can also be set. The default configuration will show a square picture; and if no profile picture is supplied, it will draw the initials with the system font on a random background color.

The `AvatarImageViewDataSource` contains the following members. All have default implementations and are hence optional.

* `var name: String { get }` - Default: returns `""`
* `var avatar: UIImage? { get }` - Default: returns `nil`
* `var bgColor: UIColor? { get }` - Default: returns `nil` 
* `var initials: String { get }` - Default: returns initials calculated from the name.
* `var avatarId: Int { get }` - Default: returns the hash values of the name and initials combined using XOR.

The `AvatarImageViewConfiguration` contains the follwing members. All have default implementations and are hence optional.

* `var shape: Shape { get }` - Default: returns `.Square`
* `var textSizeFactor: CGFloat { get }` - Default: returns `0.5`
* `var fontName: String? { get }` - Default: returns `nil` 
* `var bgColor: UIColor? { get }` - Default: returns in`nil`. The `bgColor` in `AvatarImageViewDataSource` will take precedence over this one.
* `var textColor: UIColor { get }` - Default: returns `UIColor.white()`.

Check out the [docs](http://cocoadocs.org/docsets/AvatarImageView/) for more information.

The random background colour is held in memory for each unique user, so if you have `AvatarImageView`s in different parts of your app, the background color for a particular user will be the same in both in the same session. I'm working on persisting this store so the color is consistent across all sessions.

The image view can be drawn as a square or circle out of the box. You can even sepcify a mask image if you want a custom shape. These settings are done in an `AvatarImageViewConfiguration`. Here are some examples for initials being drawn in different shapes.

<p align = "center">
![Square Initials](./Screenshots/square_initials.png)
![Circle Initials](./Screenshots/circle_initials.png)
![Mask Initials](./Screenshots/mask_initials.png)
<p>
<br /><br />
Here's an example of when the `dataSource` supplies a profile picture and the `configuration` is set to a circle.

<p align = "center">
![Circle Profile Pic](./Screenshots/circle_profile_pic.png)
<p>
<br /><br />
It works great with custom fonts!

<p align = "center">
![Custom Font](./Screenshots/circle_custom_font.png)
<p>
...and also with `UITableView`s

<p align = "center">
![Table View Pics](./Screenshots/table_view.png)
<p>
####Example Project

Please refer to the example project in this repository for an implementation of all the above use cases. If you find any bugs, open a GitHub issue!

####Gotchas

1. Always set the `configuration` before the `dataSource`. If you don't, you will need to manually call `refresh()` to render the view correctly.

2. When implementing the `AvatarImageViewDataSource` and `AvatarImageViewConfiguration` protocols, you will need to explicitly define the type for any protocol member that is an optional otherwise Swift goes insane.

For example, `AvatarImageViewConfiguration` has a type called `var fontName: String?` that returns `nil` by default. To implement this in a `struct`, define it as follows:

	struct Config: AvatarImageViewConfiguration {
            var fontName: String? = "Futura-Medium"        
	}
	
Defining it as:

	struct Config: AvatarImageViewConfiguration {
            var fontName = "Futura-Medium"        
	}
... will not work :(

## Documentation

[Docs are available on CocoaDocs](http://cocoadocs.org/docsets/AvatarImageView/)

## Requirements

AvatarImageView requires at least iOS 8.

## Installation

AvatarImageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following lines to your Podfile:

    use_frameworks!
    pod "AvatarImageView"
    
## Release Notes

####1.0.0
Initial Release

## Author

Ayush Newatia, [ayush.newatia@icloud.com](mailto:ayush.newatia@icloud.com)

## License

AvatarImageView is available under the MIT license. See the LICENSE.md file for more info.
