//
//  AvatarImageViewConfiguration.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 10/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit

/// Used to specify the shape of the image of the user's profile picture.
public enum Shape: Equatable {
    /** 
     This will set the corner radius to half the width if the view is supplied with an image. <br />
     If no image is supplied and the view draws initials, the resulting image will be clipped to a circle using a `CGPath`.
     */
    case Circle
    /// This will leave the view's corner radius untouched and will not perform any clipped.
    case Square
}

/// Implementation of the Equatable protocol to match `Shape`s
public func ==(lhs: Shape, rhs: Shape) -> Bool {
    switch (lhs, rhs) {
    case (.Circle, .Circle):
        return true
    case (.Square, .Square):
        return true
    default:
        return false
    }
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
     If this is nil, the configuartion's `bgColor` will be used. If that is also nil, a random color will be generated.
     */
    var bgColor: UIColor? { get }
    
    /// If you prefer to specify your own initials, implement this field.
    var initials: String { get }
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
    
    /// The background color for the initials. The color specified in the `AvatarImageViewDataSource` takes precedence over this. If this and the data source's color are nil, a random color will be generated.
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
            
            var nameArray = name.componentsSeparatedByString(" ")
            
            if let firstName = nameArray.first,
                let lastName = nameArray.last
                where nameArray.count > 2 {
                nameArray = [firstName, lastName]
            }
            
            var initials = ""
            nameArray.forEach { element in
                if let firstLetter = element.characters.first {
                    initials.append(firstLetter)
                }
            }
            
            return initials.uppercaseString
            
        }
    }
}

public extension AvatarImageViewConfiguration {
    /// returns `.Square`
    var shape: Shape {
        get {
            return .Square
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
            return UIColor.whiteColor()
        }
    }
}

/// An implementation of `AvatarImageViewConfiguration` with default values.
struct DefaultConfiguration: AvatarImageViewConfiguration {}