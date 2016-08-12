//
//  AvatarTableViewCell.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit
import AvatarImageView

struct TableAvatarImageConfig: AvatarImageViewConfiguration {
    let shape: Shape = .Circle
}

class AvatarTableViewCell: UITableViewCell {
    @IBOutlet var avatarImageView: AvatarImageView! {
        didSet {
            avatarImageView.configuration = TableAvatarImageConfig()
        }
    }
}
