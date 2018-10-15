//
//  StartButtonViewController.swift
//  Mini02
//
//  Created by Matheus Fracaroli on 09/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class StartButtonViewController: UIViewController {

   
    @IBAction func startButton(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "isLogged")
        
        present(TabBarController(), animated: true, completion: nil)
    }
    
    func finishOnboard() -> Bool{
        return UserDefaults.standard.bool(forKey: "isLogged")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
