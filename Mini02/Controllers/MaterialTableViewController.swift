//
//  MaterialTableViewController.swift
//  Mini02
//
//  Created by Gabriel Sousa on 17/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class MaterialTableViewController: UITableViewController {

    var materialView = MaterialView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = materialView.tableView

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
