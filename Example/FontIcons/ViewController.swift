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

    var source: UITableViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = source
    }
}



