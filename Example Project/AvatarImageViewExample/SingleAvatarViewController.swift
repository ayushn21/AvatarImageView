//
//  ViewController.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit
import AvatarImageView



class SingleAvatarViewController: UIViewController {
    @IBOutlet var avatarImageView: AvatarImageView! {
        didSet {
            configureRoundAvatar() // Comment this line for a square avatar as that is the default.
            showInitials()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        addViewProgramatically()
    }
    
    func addViewProgramatically() {
        struct DataSource: AvatarImageViewDataSource {}
        let avatarImageView = AvatarImageView(frame: CGRectMake(0, 0, 100, 100))
        avatarImageView.dataSource = DataSource()
        view.addSubview(avatarImageView)
    }
    
    func configureRoundAvatar() {
        struct Config: AvatarImageViewConfiguration { var shape: Shape = .Circle }
        avatarImageView.configuration = Config()
    }
    
    func configureHexagonAvatar() {
        struct Config: AvatarImageViewConfiguration { var shape: Shape = .Mask(image: UIImage(named: "hexagon")!) }
        avatarImageView.configuration = Config()
    }
    
    func configureRoundAvatarWithCustomFont() {
        struct Config: AvatarImageViewConfiguration {
            var shape: Shape = .Circle
            var fontName: String? = "Futura-Medium"
            
        }
        avatarImageView.configuration = Config()
    }
    
    func showProfilePicture() {
        var data = ExampleData()
        data.avatar = UIImage(named: "profile_pic")!
        avatarImageView.dataSource = data
    }
    
    func showInitials() {
        avatarImageView.dataSource = ExampleData()
    }
}

