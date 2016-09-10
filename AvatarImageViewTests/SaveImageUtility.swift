//
//  SaveImageUtility.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 11/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import UIKit

extension UIView {
    func asImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        let context = UIGraphicsGetCurrentContext()!
        layer.renderInContext(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension UIImage {
    func saveToDesktop(withName name: String = "image.png") {
        let imageData = UIImagePNGRepresentation(self)
        let simluatorDesktopPath = NSSearchPathForDirectoriesInDomains(.DesktopDirectory, .UserDomainMask, true).first!
        let splitPath = simluatorDesktopPath.componentsSeparatedByString("/")
        let path = "/\(splitPath[1])/\(splitPath[2])/Desktop/\(name)"
        
        NSFileManager.defaultManager().createFileAtPath(path, contents: imageData, attributes: nil)
    }
}
