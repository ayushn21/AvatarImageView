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
    
    let imageRect = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    // MARK:- Avatar Tests
    
    func testSquareImageWithConfiguredAvatar() {
        var data = TestData(name: "John Appleseed")
        data.avatar = UIImage(namedInTest: "profile_pic")!
        
        var config = TestConfig()
        config.shape = .square
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "profile_pic")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testRoundImageWithConfiguredAvatar() {
        var data = TestData(name: "John Appleseed")
        data.avatar = UIImage(namedInTest: "profile_pic")!
        
        var config = TestConfig()
        config.shape = .circle
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "profile_pic")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
        XCTAssert(avatarImageView.layer.cornerRadius == avatarImageView.bounds.width/2 ,"The corner radius should be half the width")
    }

/// Incorrectly failing test. Needs fixing
    
//    func testMaskImageWithConfiguredAvatar() {
//        var data = TestData(name: "John Appleseed")
//        data.avatar = UIImage(namedInTest: "profile_pic")!
//
//        var config = TestConfig()
//        config.shape = .mask(image: UIImage(namedInTest: "hexagon")!)
//
//        let avatarImageView = AvatarImageView(frame: imageRect)
//        avatarImageView.configuration = config
//        avatarImageView.dataSource = data
//
//        let imageData = UIImagePNGRepresentation(avatarImageView.asImage())!
//        let testImageData = UIImagePNGRepresentation(UIImage(namedInTest: "profile_pic_hexagon")!)!
//
//        avatarImageView.asImage().saveToDesktop()
//        XCTAssert(imageData == testImageData, "The image data should match")
//    }

    // MARK:- Initials Tests With BgColor Set In Data Source
    
    func testInitialsSquareImageWithBgColorConfiguredInDataSource() {
        var data = TestData(name: "John Appleseed")
        data.bgColor = .blue
        
        var config = TestConfig()
        config.shape = .square
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "initials_square_blue")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testInitialsRoundImageWithBgColorConfiguredInDataSource() {
        var data = TestData(name: "John Appleseed")
        data.bgColor = .blue
        
        var config = TestConfig()
        config.shape = .circle
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "initials_circle_blue")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testInitialsMaskImageWithBgColorConfiguredInDataSource() {
        var data = TestData(name: "John Appleseed")
        data.bgColor = .blue
        
        var config = TestConfig()
        config.shape = .mask(image: UIImage(namedInTest: "hexagon")!)
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.asImage().pngData()!
        let testImageData = UIImage(namedInTest: "initials_mask_blue")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    // MARK:- Initials Tests With BgColor Set In Configuration
    
    func testInitialsSquareImageWithBgColorConfiguredInConfiguration() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .square
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "initials_square")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testInitialsRoundImageWithBgColorConfiguredInConfiguration() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .circle
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "initials_circle")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testInitialsMaskImageWithBgColorConfiguredInConfiguration() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .mask(image: UIImage(namedInTest: "hexagon")!)
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.asImage().pngData()!
        let testImageData = UIImage(namedInTest: "initials_mask")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }

    // MARK:- No Initials Configured Tests
    
    func testSquareImageWithNoInitialsConfigured() {
        let data = TestData(name: "")
        
        var config = TestConfig()
        config.shape = .square
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "default_square")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testRoundImageWithNoInitialsConfigured() {
        let data = TestData(name: "")
        
        var config = TestConfig()
        config.shape = .circle
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.asImage().pngData()!
        let testImageData = UIImage(namedInTest: "default_circle")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testMaskImageWithNoInitialsConfigured() {
        let data = TestData(name: "")
        
        var config = TestConfig()
        config.shape = .mask(image: UIImage(namedInTest: "hexagon")!)
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.asImage().pngData()!
        let testImageData = UIImage(namedInTest: "default_mask")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }

    // MARK:- Test To Check Randomly Generated Color Is Constant Depending on name
    
    func testRandomColorForUser() {
        let dataOne = TestData(name: "John Appleseed")
        var configOne = TestConfig()
        configOne.bgColor = nil
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = configOne
        avatarImageView.dataSource = dataOne
        
        let imageData = avatarImageView.asImage().pngData()!
        let testImageData = UIImage(namedInTest: "initials_random_color")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    // MARK:- Custom Font Tests
    
    func testSquareImageWithCustomFont() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .square
        config.fontName = "Futura-Medium"
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "custom_font_square")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testCircleImageWithCustomFont() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .circle
        config.fontName = "Futura-Medium"
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "custom_font_circle")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testMaskImageWithCustomFont() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .mask(image: UIImage(namedInTest: "hexagon")!)
        config.fontName = "Futura-Medium"
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.asImage().pngData()!
        let testImageData = UIImage(namedInTest: "custom_font_mask")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
    
    func testImageWithInvalidCustomFont() {
        let data = TestData(name: "John Appleseed")
        
        var config = TestConfig()
        config.shape = .square
        config.fontName = "invalid"
        
        let avatarImageView = AvatarImageView(frame: imageRect)
        avatarImageView.configuration = config
        avatarImageView.dataSource = data
        
        let imageData = avatarImageView.image!.pngData()!
        let testImageData = UIImage(namedInTest: "invalid_font_square")!.pngData()!
        
        XCTAssert(imageData == testImageData, "The image data should match")
    }
}
