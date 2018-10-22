//
//  ProjectsViewController.swift
//  
//
//  Created by Peter De Nardo on 17/10/18.
//

import UIKit

class ProjectsViewController: UIViewController {

    let projectsView = ProjectsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = projectsView.setViewsInLayout()
        
        // Do any additional setup after loading the view.
    }

}
