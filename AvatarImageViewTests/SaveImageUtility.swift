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
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension UIImage {
    func saveToDesktop(withName name: String = "image.png") {
        let imageData = UIImagePNGRepresentation(self)
        let simluatorDesktopPath = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true).first!
        let splitPath = simluatorDesktopPath.components(separatedBy: "/")
        let path = "/\(splitPath[1])/\(splitPath[2])/Desktop/\(name)"
        
        FileManager.default.createFile(atPath: path, contents: imageData, attributes: nil)
    }
}
