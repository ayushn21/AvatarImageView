//
//  UIImage+TestUtils.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 11/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(namedInTest name: String) {
        self.init(named: name,
                  inBundle: NSBundle(forClass: UIImageTestUtils.self),
                  compatibleWithTraitCollection: nil)
    }
}

class UIImageTestUtils {}