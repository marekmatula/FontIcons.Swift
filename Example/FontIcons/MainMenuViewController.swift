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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFontAwesome" {
            let vc = segue.destinationViewController as! ViewController
            vc.title = "Font Awesome"
            vc.source = FADS()

        }else if segue.identifier == "showVaadinIcons" {
            let vc = segue.destinationViewController as! ViewController
            vc.title = "Vaadin Icons"
            vc.source = VIDS()
        }else if segue.identifier == "showMaterialDesing" {
            let vc = segue.destinationViewController as! ViewController
            vc.title = "MaterialDesign Icons"
            vc.source = MDDS()
        }
    }

}

class FADS: NSObject, UITableViewDataSource {
    let faIcons:[FontAwesome] = FontAwesome._500px.allValues().sort {return $0.rawValue < $1.rawValue}

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCellWithIdentifier("FontExample") as! FontExampleCell

        let icon = faIcons[indexPath.row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faIcons.count
    }
}

class VIDS: NSObject, UITableViewDataSource {
   
    let viIcons:[VaadinIcon] = VaadinIcon.Crop.allValues().sort {return $0.rawValue < $1.rawValue}

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCellWithIdentifier("FontExample") as! FontExampleCell

        let icon = viIcons[indexPath.row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viIcons.count
    }
}

class MDDS: NSObject, UITableViewDataSource {

    let icons:[MDIcon] = MDIcon.Email.allValues().sort {return $0.rawValue < $1.rawValue}

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let c = tableView.dequeueReusableCellWithIdentifier("FontExample") as! FontExampleCell

        let icon = icons[indexPath.row]
        c.iconLabel.setFontIcon(icon)
        c.nameLabel.text = "\(icon)"

        return c
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
}
