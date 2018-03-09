//
//  SourceGenerator.swift
//  FontIcons
//
//  Created by mm on 06.02.17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

class GenericGenerator{
    
    func swiftifyName(name:String) -> String {
        var t = name
        t = t.replacingOccurrences(of: "-", with: " ")
        t = t.replacingOccurrences(of: "_", with: " ")
        t = t.replacingOccurrences(of: "/", with: " ")
        t = t.capitalized
        t = t.replacingOccurrences(of: " ", with: "")
        t = lowercaseFirstLetter(text: t)
        return t
    }
    
    private func lowercaseFirstLetter(text:String) -> String {
        let first = String(text.prefix(1)).lowercased()
        let other = String(text.dropFirst())
        return first + other
    }

    
    func utfCode(code:String) -> String {
        return "\\u{\(code)}"
    }
    
}

protocol SourceGenerator{
    
  func generate()
    
}

