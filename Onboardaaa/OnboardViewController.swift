//
//  OnboardViewController.swift
//  Mini02
//
//  Created by Matheus Fracaroli on 08/10/18.
//  Copyright © 2018 Peter De Nardo. All rights reserved.
//

import UIKit



class OnboardViewController: UIPageViewController, UIPageViewControllerDelegate {
    
        required init?(coder: NSCoder) {
            super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let firstViewController = orderedViewControllers.first{
            
            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(color: "FirstPageOnboardViewController"),
                self.newColoredViewController(color: "SecondPageOnboardViewController"),
                self.newColoredViewController(color: "ThirdPageOnboardViewController"),
                self.newColoredViewController(color: "FourthPageOnboardViewController"),
                self.newColoredViewController(color: "FifthPageOnboardViewController"),
                self.newColoredViewController(color: "StartButtonViewController")]
    }()

    private func newColoredViewController(color: String) -> UIViewController{
        
        let viewController = UIStoryboard(name: "OnboardStoryboard", bundle: nil) .instantiateViewController(withIdentifier: "\(color)")
        
        if let fifthViewController = viewController as? FifthPageOnboardViewController {
            fifthViewController.onboardViewController = self
        }
        
        if let fourthViewController = viewController as? FourthPageOnboardViewController {
            fourthViewController.onboardViewController = self
        }
        
        if let thirdViewController = viewController as? ThirdPageOnboardViewController {
            thirdViewController.onboardViewController = self
        }
        
        if let secondViewController = viewController as? SecondPageOnboardViewController {
            secondViewController.onboardViewController = self
        }
        
        if let firstViewController = viewController as? FirstPageOnboardViewController {
            firstViewController.onboardViewController = self
        }
        
        return viewController
    }
    
    // Allows to back to previous page
    func goToPreviousPage(animated: Bool = true) {
        
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
        setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
    }
    
    func goToLastPage(animated: Bool = true){
        
        guard let currentViewController = self.viewControllers?.last else {return}
        guard let lastViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else {return}
        setViewControllers([lastViewController], direction: .forward, animated: animated, completion: nil)
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
}


