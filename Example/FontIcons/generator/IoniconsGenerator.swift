//
//  IoniconsGenerator.swift
//  FontIcons
//
//  Created by mm on 06.02.17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation


class IoniconsGenerator: GenericGenerator, SourceGenerator {
    var icons:[String:String] = [:]
    
    func generate() {
        parse()
        generateSource()
    }
    
    func parse() {
        var allEntries = [String:Any]()
        
        let path = Bundle.main.path(forResource: "build_data", ofType: "json")
        let jsonData = NSData(contentsOfFile: path!)! as Data
        
        allEntries = try! JSONSerialization.jsonObject(with: jsonData , options: []) as! [String:Any]
        let icons = allEntries["icons"] as! [Any]
        for icon in icons{
            let i = icon as! [String:Any]
            var code = i["code"] as! String
            code = code.replacingOccurrences(of: "0x", with: "")
            let name = swiftifyName(name: i["name"] as! String)
            
            // print("\(name)   \(code)")
            self.icons[name] = code
        }
        
    }
    
    func generateSource(){
        print("public enum IonIcon:Int { ")
        let names = self.icons.keys.sorted()
        let namesString = names.joined(separator: ", ")
        print("case \(namesString)")
        print("}")
        print("")
        print("")
        print("let ioUnicodeMap:[IonIcon: String] = [ ")
        var cnt = 0
        for name in names {
            let code = self.icons[name] ?? ""
            let mapping = ".\(name): \"\\u{\(code)}\", "
            // print("\(mapping)")
            print(mapping, separator: "", terminator: "")
            cnt += 1
            if cnt % 6 == 0 {
                print("")
            }
        }
        print("]")
        
    }
    
}
