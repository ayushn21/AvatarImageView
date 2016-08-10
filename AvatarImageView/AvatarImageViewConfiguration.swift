//
//  AvatarImageViewConfiguration.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 10/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit

public protocol AvatarImageViewDataSource {
    var name: String { get }
    
    // Optional
    var avatar: UIImage? { get }
    var bgColor: UIColor? { get }
    var initials: String { get }
}

public protocol AvatarImageViewConfiguration {
    // Optional
    var shape: Shape { get }
    var textSizeFactor: CGFloat { get }
    var fontName: String? { get }
    var textColor: UIColor { get }
}

public extension AvatarImageViewDataSource {
    
    var avatar: UIImage? {
        get {
            return nil
        }
    }
    
    var bgColor: UIColor? {
        get {
            return nil
        }
    }
    
    var initials: String {
        get {
            guard name.characters.count > 0 else {
                return ""
            }
            
            var nameArray = name.componentsSeparatedByString(" ")
            
            if nameArray.count > 2 {
                nameArray = Array(nameArray.prefix(2))
            }
            
            var initials = ""
            nameArray.forEach { element in
                guard let firstLetter = element.characters.first else {
                    return
                }
                
                initials.append(firstLetter)
            }
            
            return initials
            
        }
    }
}

public extension AvatarImageViewConfiguration {
    
    var shape: Shape {
        get {
            return .Square
        }
    }
    
    
    var textSizeFactor: CGFloat {
        get {
            return 0.5
        }
    }
    
    var fontName: String? {
        get {
            return nil
        }
    }
    
    var textColor: UIColor {
        get {
            return UIColor.whiteColor()
        }
    }
}

struct DefaultConfiguration: AvatarImageViewConfiguration {}