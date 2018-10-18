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
        tabOne.title = "Novo Projeto"
        let tabOneBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = SearchViewController()
        let tabTwoBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        tabTwo.tabBarItem = tabTwoBarItem
        
        let tabThree = ProjectsViewController()
        let tabThreeBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        tabThree.tabBarItem = tabThreeBarItem
        
        //Set Nav Controller
        let nav1 = UINavigationController(rootViewController: tabOne)
        
        
        let controllers = [nav1, tabTwo, tabThree]
        
        self.viewControllers = controllers
        
        
        
        
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
