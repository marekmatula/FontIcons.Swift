//
//  MainMenuViewController.swift
//  FontIcons
//
//  Created by Marek Matula on 09.02.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFontAwesome" {
            let vc = segue.destination as! ViewController
            vc.title = "Font Awesome"
            vc.source = FADS()

        }else if segue.identifier == "showVaadinIcons" {
            let vc = segue.destination as! ViewController
            vc.title = "Vaadin Icons"
            vc.source = VIDS()
        }else if segue.identifier == "showMaterialDesing" {
            let vc = segue.destination as! ViewController
            vc.title = "MaterialDesign Icons"
            vc.source = MDDS()
        }
    }

}

class FADS: NSObject, FontDataSource {
    let allIcons:[FontAwesome] = FontAwesome._500px.allValues().sorted {return $0.rawValue < $1.rawValue}
    var visibleIcons:[FontAwesome] = []
    
    override init() {
        self.visibleIcons = allIcons
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCell(withIdentifier: "FontExample") as! FontExampleCell

        let icon = visibleIcons[(indexPath as NSIndexPath).row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleIcons.count
    }
    
    func filter(text:String){
        visibleIcons = allIcons.filter(){ icon in
            return "\(icon)".lowercased().contains(text.lowercased())
        }
    }
}

class VIDS: NSObject, FontDataSource {
    let allIcons:[VaadinIcon] = VaadinIcon.abacus.allValues().sorted {return $0.rawValue < $1.rawValue}
    var visibleIcons:[VaadinIcon] = []
    
    override init() {
        self.visibleIcons = allIcons
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCell(withIdentifier: "FontExample") as! FontExampleCell

        let icon = visibleIcons[(indexPath as NSIndexPath).row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleIcons.count
    }
    
    func filter(text:String){
        visibleIcons = allIcons.filter(){ icon in
            return "\(icon)".lowercased().contains(text.lowercased())
        }
    }
}

class MDDS: NSObject, FontDataSource {
    let allIcons:[MDIcon] = MDIcon.accessAlarm.allValues().sorted {return $0.rawValue < $1.rawValue}
    var visibleIcons:[MDIcon] = []

    override init() {
        self.visibleIcons = allIcons
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCell(withIdentifier: "FontExample") as! FontExampleCell

        let icon = visibleIcons[(indexPath as NSIndexPath).row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleIcons.count
    }
    
    func filter(text:String){
        visibleIcons = allIcons.filter(){ icon in
            return "\(icon)".lowercased().contains(text.lowercased())
        }
    }
}
