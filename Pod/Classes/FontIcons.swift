//
//  FontIcons.swift
//
//  Created by Marek Matula on 05.02.16.
//  Copyright © 2016 Marek Matula. All rights reserved.
//

import Foundation
import UIKit


public protocol FontEnum {

    func fontName() ->  String
    func unicode() ->  String
    func error() ->  String
    func loadFontIfNeeded()
}


public class FontLoader {

    static func loadFontIfNeeded(icon: FontEnum) {
        let fn = icon.fontName()
        if (UIFont.fontNamesForFamilyName(fn).count == 0) {
            icon.loadFontIfNeeded()
        }
    }

    public static func loadFont(fontName:String, bundleName: String) {

        let bundle = NSBundle(forClass: FontLoader.self)
        var fontURL = NSURL()
        let identifier = bundle.bundleIdentifier

        if identifier?.hasPrefix("org.cocoapods") == true {
            fontURL = bundle.URLForResource(fontName, withExtension: "ttf", subdirectory: bundleName)!
        } else {

            fontURL = bundle.URLForResource(fontName, withExtension: "ttf")!
        }
        let data = NSData(contentsOfURL: fontURL)!

        let provider = CGDataProviderCreateWithCFData(data)
        let font = CGFontCreateWithDataProvider(provider)!

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {

            let errorDescription: CFStringRef = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSInternalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }

    static func getFont(icon: FontEnum, iconSize: CGFloat ) -> UIFont{

        loadFontIfNeeded(icon)
        let font = UIFont(name: icon.fontName(), size: iconSize)
        assert(font != nil, icon.error())

        return font!
    }

    static func concat(prefix prefix: String, icon: FontEnum, postfix:String ) -> String{
        return prefix + icon.unicode() + postfix
    }
}
