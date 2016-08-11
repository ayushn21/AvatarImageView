//
//  AvatarImageViewTests.swift
//  AvatarImageViewTests
//
//  Created by Ayush Newatia on 10/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import XCTest
@testable import AvatarImageView

class AvatarImageViewTests: XCTestCase {
    
    let imageRect = CGRectMake(0, 0, 100, 100)
    
    func testSquareImageWithConfiguredAvatar() {
        var data = TestData(name: "John Appleseed")
        data.avatar = UIImage(namedInTest: "profile_pic")!
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "profile_pic")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testRoundImageWithConfiguredAvatar() {
        var data = TestData(name: "John Appleseed")
        data.avatar = UIImage(namedInTest: "profile_pic")!
        
        var config = TestConfig()
        config.shape = .Circle
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "profile_pic")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
        XCTAssert(avatarImageView.layer.cornerRadius == avatarImageView.bounds.width/2 ,"The corner radius should be half the width")
    }
}
