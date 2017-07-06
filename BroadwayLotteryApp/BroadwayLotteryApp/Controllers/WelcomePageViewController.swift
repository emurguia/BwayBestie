//
//  WelcomePageViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/6/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIPageViewController {

    //get view controllers
    private(set) lazy var orderedViewControllers: [UIViewController] = { return [self.newViewController(number:"One"), self.newViewController(number:"Two"), self.newViewController(number:"Three"), self.newViewController(number:"Four")]}()
    
    private func newViewController(number: String) -> UIViewController{
        return UIStoryboard(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: "Welcome\(number)ViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        //set first view controller 
        if let firstViewController = orderedViewControllers.first{
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   

}

//MARK: UIPageViewControllerDataSource 

extension WelcomePageViewController: UIPageViewControllerDataSource{
    /*
     * Required methods for UIPageViewControllerDataSource 
     * Methods provide view controllers to UIPageViewController
     */
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else{
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else{
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else{
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController)else{
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else{
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else{
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    /*
     * Methods to support page indicator
     */
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else{
            return 0
        }
        return firstViewControllerIndex
    }
}
