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
    var bgColor: UIColor?
    
    init(name: String) {
        self.name = name
    }
}