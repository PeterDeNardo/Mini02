//
//  NewMaterialViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 12/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class NewMaterialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let newMaterial = NewMaterialView()
        self.view = newMaterial.setLayoutInView()
        self.title = "Novo objeto"
        // Do any additional setup after loading the view.
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
