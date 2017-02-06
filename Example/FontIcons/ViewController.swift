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
    @IBOutlet weak var search: UISearchBar!

    var source: FontDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = source
        search.delegate = self
    }
}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.source?.filter(text: searchText)
        self.tableView.reloadData()
    }

}

protocol FontDataSource : UITableViewDataSource {
    
    func filter(text:String)
}


