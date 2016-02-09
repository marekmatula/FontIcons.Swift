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
        }
    }

}

class FADS: NSObject, UITableViewDataSource {
    let faIcons:[FontAwesome] = FontAwesome._500px.allValues()

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
   
    let viIcons:[VaadinIcon] = VaadinIcon.Crop.allValues()

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