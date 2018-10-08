//
//  NewProjectViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 07/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class NewProjectViewController: UIViewController {
    
    let viewProject = ViewProject()
    let myNavigationBar = MyNavigationBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewProject.setLayoutInView(view: self.view)
       // myNavigationBar.creatNavigationBar(view: self.view)
    }
    
    @objc func teste () {
        print("done")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
