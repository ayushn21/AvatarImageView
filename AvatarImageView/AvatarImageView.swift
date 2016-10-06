//
//  AvatarImageView.swift
//  AvatarImageView
//
//  Created by Ayush Newatia on 10/08/2016.
//  Copyright © 2016 Spectrum. All rights reserved.
//

import UIKit

/**
 A subclass of `UIImageView` that is designed to show a user's profile picture. It will fall back to the user's initials if a picture is not supplied.
 An implementation of the `AvatarImageViewDataSource` must be supplied to populate the image view. Optionally, you can also set a configuration that conforms to `AvatarImageViewConfiguration`.
 
 If the image falls back to the user's initials, a random background color will be generated unless one is specified in `AvatarImageViewDataSource` or `AvatarImageViewConfiguration`. The background color is generated for each unique user from its `avatarId`. So if the same user's profile picture is shown in 2 different places in the app, the background color will be the same.
 
 Please see the docs for `AvatarImageViewDataSource` and `AvatarImageViewConfiguration` for further information.
 
 This library assumes that the view will be a square. There is no code to handle views where width != height and could lead to weird behaviour.
 
 The background color and image will be set to `clear()` and `nil` at initialisation, so these values should not be set in the storyboard or passed in at initialisation time.
 */

open class AvatarImageView: UIImageView {
    
    static let colorCache = ColorCache<NSString>()

    /// The data source to populate the Avatar Image
    open var dataSource: AvatarImageViewDataSource? {
        didSet {
            refresh()
        }
    }
    
    /** 
     The configuration for the AvatarImageView. Use this for settings such as shape, font size, etc.
     Always set this value BEFORE the data source, otherwise the view will not render correctly.
     
     If you would like to set this value after the data source, you need to call `refresh()` to re-draw the view correctly.
    */
    open var configuration: AvatarImageViewConfiguration
        = DefaultConfiguration()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override private init(image: UIImage?) {
        super.init(image: image)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        backgroundColor = .clear
        image = nil
    }
    
    func textAttributesFrom(data: AvatarImageViewDataSource) -> [String : AnyObject] {
        var attributes: [String : AnyObject] = [NSForegroundColorAttributeName : configuration.textColor]
        let fontSize = bounds.size.width * configuration.textSizeFactor
        
        if let fontName = configuration.fontName {
            attributes[NSFontAttributeName] = UIFont(name: fontName, size: fontSize)
        }
        else {
            attributes[NSFontAttributeName] = UIFont.systemFont(ofSize: fontSize)
        }
        
        return attributes
    }
    
    func drawImageWith(data:AvatarImageViewDataSource) -> UIImage {
        let scale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        
        guard context != nil else {
            return UIImage()
        }
        
        switch configuration.shape {
        case .circle:
            let circlePath = CGPath(ellipseIn: self.bounds, transform: nil)
            context!.addPath(circlePath)
            context!.clip()
            break
        case .mask(let image):
            mask(layer: layer, withImage: image)
        default:
            break
        }
        
        var bgColor: CGColor! = nil
        if let color = data.bgColor {
            bgColor = color.cgColor
        }
        else if let color = configuration.bgColor {
            bgColor = color.cgColor
        }
        else {
            bgColor = backgroundColorFor(hash: data.avatarId)
        }
        
        context!.setFillColor(bgColor)
        context!.fill(self.bounds)
        
        let initials = data.initials as NSString
        let textAttrs = textAttributesFrom(data: data)
        let textRectSize = initials.size(attributes: textAttrs)
        let textRect = CGRect(x: bounds.size.width / 2 - textRectSize.width / 2,
                              y: bounds.size.height / 2 - textRectSize.height / 2,
                              width: textRectSize.width,
                              height: textRectSize.height)
        
        initials.draw(in: textRect, withAttributes: textAttrs)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = image {
            return image
        }
        else {
            return UIImage()
        }
    }
    
    /// Redraws the image based on the current data source and configuration
    public func refresh() {
        guard let dataSource = dataSource else {
            image = nil
            return
        }
        
        if let avatar = dataSource.avatar {
            image = avatar
            switch configuration.shape {
            case .circle:
                layoutIfNeeded()
                clipsToBounds = true
                layer.cornerRadius = bounds.size.width/2
                break
            case .mask(let image):
                mask(layer: layer, withImage: image)
            default:
                break
            }
        }
        else {
            image = drawImageWith(data: dataSource)
        }
        setNeedsDisplay()
    }


    // MARK:- Utilities
    
    private func backgroundColorFor(hash: Int) -> CGColor {
        if let colorString = AvatarImageView.colorCache[hash] {
            let colors = colorString.components(separatedBy: "^")
            
            let red = CGFloat((colors[0] as NSString).doubleValue)
            let green = CGFloat((colors[1] as NSString).doubleValue)
            let blue = CGFloat((colors[2] as NSString).doubleValue)
            
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor
        }
        else {
            srand48(hash)
            
            let red = CGFloat(drand48())
            let green = CGFloat(drand48())
            let blue = CGFloat(drand48())
            
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor
            let stringRepresentation = "\(red)^\(green)^\(blue)"
            
            AvatarImageView.colorCache[hash] = stringRepresentation as NSString?
            return color
        }
    }
    
    private func mask(layer: CALayer, withImage image: UIImage) {
        let mask = CALayer()
        mask.contents = image.cgImage
        mask.frame = bounds
        layer.mask = mask
        layer.masksToBounds = true
    }
}
