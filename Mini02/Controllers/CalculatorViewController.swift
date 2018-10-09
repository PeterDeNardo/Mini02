//
//  NewProjectViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 07/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController{
    
    private let viewCalculator = ViewCalculator()
    let myNavigationBar = MyNavigationBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewCalculator.setLayoutInView(view: self.view)
        viewCalculator.btnCostsButton.addTarget(self, action: "goToCalculatorPluss", for: .touchUpInside)
        
     
    }
    
    @objc func goToCalculatorPluss () {
        let calculatorPluss = CalculatorPlussViewController()
        navigationController?.pushViewController(calculatorPluss, animated: true)
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
