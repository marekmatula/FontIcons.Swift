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


open class FontLoader {

    static func loadFontIfNeeded(_ icon: FontEnum) {
        let fn = icon.fontName()
        if (UIFont.fontNames(forFamilyName: fn).count == 0) {
            icon.loadFontIfNeeded()
        }
    }

    open static func loadFont(_ fontName:String, bundleName: String) {

        let bundle = Bundle(for: FontLoader.self)
        var fontURL : URL?

        fontURL = bundle.url(forResource: fontName, withExtension: "ttf", subdirectory: bundleName)
        if fontURL == nil{
            fontURL = bundle.url(forResource: fontName, withExtension: "ttf")
        }

        let data = try! Data(contentsOf: fontURL!)

        let provider = CGDataProvider(data: data as CFData)
        let font = CGFont(provider!)

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {

            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }

    static func getFont(_ icon: FontEnum, iconSize: CGFloat ) -> UIFont{

        loadFontIfNeeded(icon)
        let font = UIFont(name: icon.fontName(), size: iconSize)
        assert(font != nil, icon.error())

        return font!
    }

    static func concat(prefix: String, icon: FontEnum, postfix:String ) -> String{
        return prefix + icon.unicode() + postfix
    }
}
