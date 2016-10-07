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

class FADS: NSObject, UITableViewDataSource {
    let faIcons:[FontAwesome] = FontAwesome._500px.allValues().sorted {return $0.rawValue < $1.rawValue}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCell(withIdentifier: "FontExample") as! FontExampleCell

        let icon = faIcons[(indexPath as NSIndexPath).row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faIcons.count
    }
}

class VIDS: NSObject, UITableViewDataSource {
   
    let viIcons:[VaadinIcon] = VaadinIcon.crop.allValues().sorted {return $0.rawValue < $1.rawValue}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCell(withIdentifier: "FontExample") as! FontExampleCell

        let icon = viIcons[(indexPath as NSIndexPath).row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viIcons.count
    }
}

class MDDS: NSObject, UITableViewDataSource {

    let icons:[MDIcon] = MDIcon.email.allValues().sorted {return $0.rawValue < $1.rawValue}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCell(withIdentifier: "FontExample") as! FontExampleCell

        let icon = icons[(indexPath as NSIndexPath).row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
}
