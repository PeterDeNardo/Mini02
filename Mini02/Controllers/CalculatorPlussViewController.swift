//
//  ProjectCreatePlussViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 08/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class CalculatorPlussViewController: UIViewController {

    private let viewCalculatorPluss = ViewCalculatorPluss()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCalculatorPluss.setLayoutInView(view: self.view)

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
