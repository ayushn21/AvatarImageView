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
    
    lazy var notificationCenter = NSNotificationCenter.defaultCenter()
    lazy var application = UIApplication.sharedApplication()
    
    init() {
        notificationCenter.addObserver(self,
                                       selector: #selector(clear),
                                       name: UIApplicationDidReceiveMemoryWarningNotification,
                                       object: application)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
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
    
    @objc func clear() {
        cache.removeAllObjects()
    }
}