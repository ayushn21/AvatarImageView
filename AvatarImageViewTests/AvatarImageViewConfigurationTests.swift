//
//  AvatarImageViewConfigurationTests.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 11/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import XCTest
@testable import AvatarImageView

class AvatarImageViewConfigurationTests: XCTestCase {
    
    func testInitialsForTwoWordsCapitalised() {
        let data = TestData(name: "John Appleseed")
        let expectedInitials = "JA"
        
        XCTAssert(data.initials == expectedInitials, "The initials (\(data.initials)) should match the expected value (\(expectedInitials))")
    }
    
    func testInitialsForTwoWordsNotCapitalised() {
        let data = TestData(name: "john appleseed")
        let expectedInitials = "JA"
        
        XCTAssert(data.initials == expectedInitials, "The initials (\(data.initials)) should match the expected value (\(expectedInitials))")
    }
    
    func testInitialsForOneWordCapitalised() {
        let data = TestData(name: "john")
        let expectedInitials = "J"
        
        XCTAssert(data.initials == expectedInitials, "The initials (\(data.initials)) should match the expected value (\(expectedInitials))")
    }
    
    func testInitialsForOneWordNotCapitalised() {
        let data = TestData(name: "John")
        let expectedInitials = "J"
        
        XCTAssert(data.initials == expectedInitials, "The initials (\(data.initials)) should match the expected value (\(expectedInitials))")
    }
    
    func testInitialsForThreeWordsCapitalised() {
        let data = TestData(name: "John MiddleName Appleseed")
        let expectedInitials = "JA"
        
        XCTAssert(data.initials == expectedInitials, "The initials (\(data.initials)) should match the expected value (\(expectedInitials))")
    }
    
    func testInitialsForThreeWordsNotCapitalised() {
        let data = TestData(name: "john middleName appleseed")
        let expectedInitials = "JA"
        
        XCTAssert(data.initials == expectedInitials, "The initials (\(data.initials)) should match the expected value (\(expectedInitials))")
    }
    
    func testInitialsWithEmptyName() {
        let data = TestData(name: "")
        let expectedInitials = ""
        
        XCTAssert(data.initials == expectedInitials, "The initials (\(data.initials)) should match the expected value (\(expectedInitials))")

    }
}