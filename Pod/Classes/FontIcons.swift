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
    func bundleName() ->  String
    func unicode() ->  String
    func error() ->  String
}


public class FontLoader {

    struct Static {
//        TODO
        static var onceToken : dispatch_once_t = 0
    }

    static func loadFontIfNeeded(icon: FontEnum) {
        let fn = icon.fontName()
        if (UIFont.fontNamesForFamilyName(fn).count == 0) {

            dispatch_once(&Static.onceToken) {
                let bundle = NSBundle(forClass: FontLoader.self)
                var fontURL = NSURL()
                let identifier = bundle.bundleIdentifier

                if identifier?.hasPrefix("org.cocoapods") == true {
                    fontURL = bundle.URLForResource(fn, withExtension: "ttf", subdirectory: icon.bundleName())!
                } else {

                    fontURL = bundle.URLForResource(fn, withExtension: "ttf")!
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



//private struct FAStruct {
//
//    static let FontName = "FontAwesome"
//    static let ErrorAnnounce = "****** FONT AWESOME SWIFT - FontAwesome font not found in the bundle or not associated with Info.plist when manual installation was performed. ******"
//}




