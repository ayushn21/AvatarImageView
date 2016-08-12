//
//  AvatarImageExampleData.swift
//  AvatarImageViewExample
//
//  Created by Ayush Newatia on 12/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import Foundation
import AvatarImageView

struct ExampleData: AvatarImageViewDataSource {
    var name: String
    var avatar: UIImage?
    
    init() {
        name = ExampleData.randomName()
    }
    
    static func randomName() -> String {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let charSetArray = charSet.characters.map { String($0) }
        
        var string = ""
        
        for _ in 0..<5 {
            string += charSetArray[Int(arc4random()) % charSetArray.count]
        }
        
        string += " "
        
        for _ in 0..<5 {
            string += charSetArray[Int(arc4random()) % charSetArray.count]
        }
        
        return string
    }
}