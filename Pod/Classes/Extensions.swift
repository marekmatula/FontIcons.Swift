//
//  Extensions.swift
//  FontIcons.swift
//
//  Created by Marek Matula on 05.02.16.
//  Copyright © 2016 Marek Matula. All rights reserved.
//

import Foundation
import UIKit

private let defaultSize:CGFloat = 23.0

public extension UIBarButtonItem {

    func setFontIcon(_ icon: FontEnum, size: CGFloat = defaultSize) {
        setFontIconText(prefix: "", icon: icon, postfix: "", size: size)
    }

    func setFontIconText(prefix: String, icon: FontEnum, postfix: String, size: CGFloat) {

        let font = FontLoader.getFont(icon, iconSize: size)
        setTitleTextAttributes([NSFontAttributeName: font], for: UIControlState())
        title = FontLoader.concat(prefix: prefix, icon: icon, postfix: postfix)
    }
}

public extension UIButton {

    func setFontIcon(_ icon: FontEnum, forState: UIControlState) {
        if let label = titleLabel {
            setFontIcon(icon, size: label.font.pointSize, forState: forState)
        }
    }

    func setFontIcon(_ icon: FontEnum, size:CGFloat, forState: UIControlState) {
        setFontIconText(prefix: "", icon: icon, postfix: "", size: size, forState: forState)
    }

    func setFontIconText(prefix: String, icon: FontEnum, postfix: String, size: CGFloat, forState: UIControlState) {

        let font = FontLoader.getFont(icon, iconSize: size)

        if let label = titleLabel {
            label.font = font
            let text = FontLoader.concat(prefix: prefix, icon: icon, postfix: postfix)
            setTitle(text, for: forState)
        }
    }
}

public extension UILabel {

    func setFontIcon(_ icon: FontEnum, size: CGFloat = defaultSize) {
        setFontIconText(prefix: "", icon: icon, postfix: "", size: size)
    }

    func setFontIconText(prefix: String, icon: FontEnum, postfix: String, size: CGFloat) {

        let font = FontLoader.getFont(icon, iconSize: size)
        self.font = font
        self.text = FontLoader.concat(prefix: prefix, icon: icon, postfix: postfix)
    }
}

public extension UIImageView {

     public func setFontIcon(_ icon: FontEnum, textColor: UIColor, backgroundColor: UIColor = UIColor.clear) {

        self.image = UIImage(icon: icon, size: frame.size, textColor: textColor, backgroundColor: backgroundColor)
    }
}


public extension UITabBarItem {

    public func setFontIcon(_ icon: FontEnum) {

        image = UIImage(icon: icon, size: CGSize(width: 30, height: 30))
    }
}


public extension UISegmentedControl {

    public func setFontIcon(_ icon: FontEnum, forSegmentAtIndex segment: Int) {

        let font = FontLoader.getFont(icon, iconSize: defaultSize)

        setTitleTextAttributes([NSFontAttributeName: font], for: UIControlState())
        setTitle(icon.unicode(), forSegmentAt: segment)
    }
}


public extension UIImage {

    public convenience init(icon: FontEnum, size: CGSize, textColor: UIColor = UIColor.black, backgroundColor: UIColor = UIColor.clear) {

        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = NSTextAlignment.center

        // Taken from FontAwesome.io's Fixed Width Icon CSS
        let fontAspectRatio: CGFloat = 1.28571429
        let fontSize = min(size.width / fontAspectRatio, size.height)

        let font = FontLoader.getFont(icon, iconSize: fontSize)
        let attributes = [NSFontAttributeName: font, NSForegroundColorAttributeName: textColor, NSBackgroundColorAttributeName: backgroundColor, NSParagraphStyleAttributeName: paragraph]

        let attributedString = NSAttributedString(string: icon.unicode(), attributes: attributes)
        UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
        attributedString.draw(in: CGRect(x: 0, y: (size.height - fontSize) / 2, width: size.width, height: fontSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!, scale: image!.scale, orientation: image!.imageOrientation)
    }
}


public extension UISlider {

    func setFontIconMaximumValueImage(_ icon: FontEnum, customSize: CGSize? = nil) {

        maximumValueImage = UIImage(icon: icon, size: customSize ?? CGSize(width: 25, height: 25))
    }


    func setFontIconMinimumValueImage(_ icon: FontEnum, customSize: CGSize? = nil) {
        
        minimumValueImage = UIImage(icon: icon, size: customSize ?? CGSize(width: 25, height: 25))
    }
}
