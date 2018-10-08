//
//  MyNavigationController.swift
//  Mini02
//
//  Created by Peter De Nardo on 07/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class MyNavigationBarController: UINavigationController {
    
    func creatNavigationController(view: UIView) {
       // let navController : UINavigationController = UINavigationController(rootViewController: view)
        
        let navBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 64))
        navBar.backgroundColor = .black
        let navTitleItem = UINavigationItem(title: "test")
        let navResetButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: nil, action: #selector(teste))
        navTitleItem.leftBarButtonItem = navResetButtonItem
        navBar.setItems([navTitleItem], animated: true)
        view.addSubview(navBar);
    }
    
    @objc func teste () {
        print("done")
    }
    
//    let resetButton = UIButton(type: .custom)
//    resetButton.setTitle("Reset", for: .normal)
//    resetButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//    resetButton.addTarget(self, action: #selector(class.Methodname), for: .touchUpInside)
//    let leftItemBar = UIBarButtonItem(customView: resetButton)
//    self.navigationItem.setLeftBarButton(leftItemBar, animated: true)

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
