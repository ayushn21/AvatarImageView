//
//  ColorCache.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 15/08/2016.
//  Copyright © 2016 Ayush Newatia. All rights reserved.
//

import Foundation

final class ColorCache<ValueType: AnyObject> {
    
    private let cache = NSCache()
    
    subscript(key: Int) -> ValueType? {
        get {
            return cache.objectForKey(key) as? ValueType
        }
        set {
            if let value: ValueType = newValue {
                cache.setObject(value, forKey: key)
            }
            else {
                cache.removeObjectForKey(key)
            }
        }
    }
    
    func clear() {
        cache.removeAllObjects()
    }
}