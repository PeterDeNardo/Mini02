//
//  OnboardViewController.swift
//  Mini02
//
//  Created by Matheus Fracaroli on 08/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit

class OnboardViewController: UIPageViewController, UIPageViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstViewController = orderedViewControllers.first{
            
            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
        
        dataSource = self
        delegate = self
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(color: "FirstPageViewController"),
                self.newColoredViewController(color: "SecondPageViewController"),
                self.newColoredViewController(color: "ThirdPageViewController"),
                self.newColoredViewController(color: "FourthPageViewController"),
                self.newColoredViewController(color: "FifthPageViewController"),
                self.newColoredViewController(color: "SixthPageViewController")]
    }()

    private func newColoredViewController(color: String) -> UIViewController{
        return UIStoryboard(name: "OnboardStoryboard", bundle: nil) .instantiateViewController(withIdentifier: "\(color)")
    }
}

extension OnboardViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else{
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else{
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: OnboardViewController) -> Int {
        return 6
    }
    
    func presentationIndexForPageViewController(pageViewController: OnboardViewController) -> Int {
        return 0
    }
}

