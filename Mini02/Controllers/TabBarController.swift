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
        let tabOneBarItem = UITabBarItem(title: nil, image: UIImage(named: "calculadoraItemGrey"), selectedImage: UIImage(named: "calculadoraItemBlue"))
        //tabOneBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = SearchViewController()
        let tabTwoBarItem = UITabBarItem(title: nil, image: UIImage(named: "searchItemGrey"), selectedImage: UIImage(named: "searchItemBlue"))
        //tabTwoBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        tabTwo.tabBarItem = tabTwoBarItem
        
        let tabThree = ProjectsViewController()
        let tabThreeBarItem = UITabBarItem(title: nil, image: UIImage(named: "projectsItemBGrey"), selectedImage: UIImage(named: "projectsItemBlue"))
        //tabThreeBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
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
