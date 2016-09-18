//
//  TestData.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 11/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation
@testable import AvatarImageView

struct TestData: AvatarImageViewDataSource {
    var name: String
    var avatar: UIImage?
    var bgColor: UIColor?
    
    init(name: String) {
        self.name = name
    }
}

struct TestConfig: AvatarImageViewConfiguration {
    var shape: Shape = .square
    var bgColor: UIColor? = UIColor.green
    var fontName: String?
}
