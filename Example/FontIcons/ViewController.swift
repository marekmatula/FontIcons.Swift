//
//  ViewController.swift
//  FontIcons
//
//  Created by Marek Matula on 02/08/2016.
//  Copyright (c) 2016 Marek Matula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let faIcons = FontAwesome._500px.allValues()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource {

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


extension ViewController: UITableViewDelegate {

}