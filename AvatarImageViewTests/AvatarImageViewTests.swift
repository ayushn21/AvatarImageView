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
    
    // MARK:- Avatar Tests
    
    func testSquareImageWithConfiguredAvatar() {
        var data = TestData(name: "John Appleseed")
        data.avatar = UIImage(namedInTest: "profile_pic")!
        
        var config = TestConfig()
        config.shape = .Square
        
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
    
    func testMaskImageWithConfiguredAvatar() {
        var data = TestData(name: "John Appleseed")
        data.avatar = UIImage(namedInTest: "profile_pic")!
        
        var config = TestConfig()
        config.shape = .Mask(image: UIImage(namedInTest: "hexagon")!)
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.asImage())!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "profile_pic_hexagon")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    // MARK:- Initials Tests With BgColor Set In Data Source
    
    func testInitialsSquareImageWithBgColorConfiguredInDataSource() {
        var data = TestData(name: "John Appleseed")
        data.bgColor = .blueColor()
        
        var config = TestConfig()
        config.shape = .Square
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "initials_square_blue")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testInitialsRoundImageWithBgColorConfiguredInDataSource() {
        var data = TestData(name: "John Appleseed")
        data.bgColor = .blueColor()
        
        var config = TestConfig()
        config.shape = .Circle
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "initials_circle_blue")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testInitialsMaskImageWithBgColorConfiguredInDataSource() {
        var data = TestData(name: "John Appleseed")
        data.bgColor = .blueColor()
        
        var config = TestConfig()
        config.shape = .Mask(image: UIImage(namedInTest: "hexagon")!)
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.asImage())!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "initials_mask_blue")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    // MARK:- Initials Tests With BgColor Set In Configuration
    
    func testInitialsSquareImageWithBgColorConfiguredInConfiguration() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .Square
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "initials_square")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testInitialsRoundImageWithBgColorConfiguredInConfiguration() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .Circle
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "initials_circle")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testInitialsMaskImageWithBgColorConfiguredInConfiguration() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .Mask(image: UIImage(namedInTest: "hexagon")!)
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.asImage())!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "initials_mask")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }

    // MARK:- No Initials Configured Tests
    
    func testSquareImageWithNoInitialsConfigured() {
        let data = TestData(name: "")
        
        var config = TestConfig()
        config.shape = .Square
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "default_square")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testRoundImageWithNoInitialsConfigured() {
        let data = TestData(name: "")
        
        var config = TestConfig()
        config.shape = .Circle
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.asImage())!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "default_circle")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testMaskImageWithNoInitialsConfigured() {
        let data = TestData(name: "")
        
        var config = TestConfig()
        config.shape = .Mask(image: UIImage(namedInTest: "hexagon")!)
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.asImage())!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "default_mask")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }

    // MARK:- Test To Check Randomly Generated Color Is Constant Depending on name
    
    func testRandomColorForUser() {
        let dataOne = TestData(name: "John Appleseed")
        var configOne = TestConfig()
        configOne.bgColor = nil
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = configOne
        avatarImageView.dataSource = dataOne
        
        let imageData = UIImagePNGRepresentation(avatarImageView.asImage())!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "initials_random_color")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    // MARK:- Custom Font Tests
    
    func testSquareImageWithCustomFont() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .Square
        config.fontName = "Futura-Medium"
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "custom_font_square")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testCircleImageWithCustomFont() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .Circle
        config.fontName = "Futura-Medium"
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "custom_font_circle")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testMaskImageWithCustomFont() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .Mask(image: UIImage(namedInTest: "hexagon")!)
        config.fontName = "Futura-Medium"
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.asImage())!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "custom_font_mask")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
    
    func testImageWithInvalidCustomFont() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .Square
        config.fontName = "invalid"
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = UIImagePNGRepresentation(avatarImageView.image!)!
        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "invalid_font_square")!)!
        
        XCTAssert(imageData.isEqualToData(testImageData), "The image data should match")
    }
}
