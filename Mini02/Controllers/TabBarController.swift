//
//  ViewController.swift
//  Mini02
//
//  Created by Peter De Nardo on 07/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    //private var myNavigationController : UINavigationController?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Setting Tab bar
        let tabOne = CalculatorViewController()
        let tabOneBarItem = UITabBarItem(title: "", image: UIImage(named: "icon01TabBar"), selectedImage: UIImage(named: "icon01TabBarAzul"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = SearchViewController()
        let tabTwoBarItem = UITabBarItem(title: "", image: UIImage(named: "icon02TabBar"), selectedImage: UIImage(named: "icon02TabBarAzul"))
        
        tabTwo.tabBarItem = tabTwoBarItem
        
        let tabThree = ProjectsViewController()
        let tabThreeBarItem = UITabBarItem(title: "", image: UIImage(named: "icon03TabBar"), selectedImage: UIImage(named: "icon03TabBarAzul"))
        
        tabThree.tabBarItem = tabThreeBarItem
        
        //Set Nav Controller
        
        
        let controllers = [tabOne, tabTwo, tabThree]
        
        self.viewControllers = controllers.map{
            UINavigationController(rootViewController: $0)
        }
        
        
        
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("selected\(viewController.title)")
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
