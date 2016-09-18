//
//  AvatarImageViewConfiguration.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 10/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit

/// Used to specify the shape of the image of the user's profile picture.
public enum Shape {
    /** 
     This will set the corner radius to half the width if the view is supplied with an image. <br />
     If no image is supplied and the view draws initials, the resulting image will be clipped to a circle using a `CGPath`.
     */
    case circle
    /// This will leave the view's corner radius untouched and will not perform any clipping.
    case square
    
    /// Specify a custom shape using a mask image. Please ensure this image is of equal height and width.
    case mask(image: UIImage)
}

/**
 This protocol supplies data to the AvatarImageView. Ideally you should add this protocol to your model and just pass that in.<br />
 All the fields are optional as they have default implementations.
 */
public protocol AvatarImageViewDataSource {
    
    /// The user's name. This will be used to generate the initials.
    var name: String { get }
    
    /// The user's profile picture. If this is nil, the user's initials will be set.
    var avatar: UIImage? { get }
    
    /**
     The background color for the initials. This value DOES NOT set the background color of the image view.<br />
     If this is nil, the configuration's `bgColor` will be used. If that is also nil, a random color will be generated.
     */
    var bgColor: UIColor? { get }
    
    /// If you prefer to specify your own initials, implement this field.
    var initials: String { get }
    
    /**
     This is a hash used to ensure uniqueness of colors across users. It is used as the seed to generate the random color ensure it's always the same for each unique user. This protocol does not inherit from `Hashable` due to the way Swift's type system work with `Equatable`.
     */
    var avatarId: Int { get }
}

/**
 A protocol to specify the configuration of the `AvatarImageView`. A struct called `DefaultConfiguration` is provided and set on the `AvatarImageView` by default.
 */
public protocol AvatarImageViewConfiguration {
    /// The shape of the Avatar image.
    var shape: Shape { get }
    
    /// The height of the view is multiplied by this factor to get the size the text will be drawn at.
    var textSizeFactor: CGFloat { get }
    
    /// The name of the font to be used to draw text. If this is nil, the system font will be used.
    var fontName: String? { get }
    
    /** 
     The background color for the initials. This value DOES NOT set the background color of the image view.<br />
     The color specified in the `AvatarImageViewDataSource` takes precedence over this. If this and the data source's `bgColor` are nil, a random color will be generated.
     */
    var bgColor: UIColor? { get }
    
    /// The color of the text.
    var textColor: UIColor { get }
}

/// Default implementation of `AvatarImageViewDataSource`
public extension AvatarImageViewDataSource {
    /// returns `""`
    var name: String {
        get {
            return ""
        }
    }
    
    /// returns `nil`
    var avatar: UIImage? {
        get {
            return nil
        }
    }
    
    /// returns `nil`
    var bgColor: UIColor? {
        get {
            return nil
        }
    }
    
    /**
     The first letter of the first and last words of the `name` field is capitalised and returned. Eg. `John Appleseed` will return `JA`.<br />
     If the length of the String returned by `name` is not greater than 0, it will return ``
     */
    var initials: String {
        get {
            guard name.characters.count > 0 else {
                return ""
            }
            
            var nameArray = name.components(separatedBy: " ")
            
            if let firstName = nameArray.first,
                let lastName = nameArray.last
                , nameArray.count > 2 {
                nameArray = [firstName, lastName]
            }
            
            var initials = ""
            nameArray.forEach { element in
                if let firstLetter = element.characters.first {
                    initials.append(firstLetter)
                }
            }
            
            return initials.uppercased()
            
        }
    }
    
    ///  returns the hash values of the name and initials combined with an XOR operator. This should ideally be improved by adding something more unique like an email address to the hash.
    var avatarId: Int {
        get {
            return name.hashValue ^ initials.hashValue
        }
    }
}

public extension AvatarImageViewConfiguration {
    /// returns `.Square`
    var shape: Shape {
        get {
            return .square
        }
    }
    
    /// returns `0.5`
    var textSizeFactor: CGFloat {
        get {
            return 0.5
        }
    }
    
    /// returns `nil`
    var fontName: String? {
        get {
            return nil
        }
    }
    
    /// returns `nil`
    var bgColor: UIColor? {
        get {
            return nil
        }
    }
    
    /// returns `UIColor.white()`
    var textColor: UIColor {
        get {
            return .white
        }
    }
}

/// An implementation of `AvatarImageViewConfiguration` with default values.
struct DefaultConfiguration: AvatarImageViewConfiguration {}
