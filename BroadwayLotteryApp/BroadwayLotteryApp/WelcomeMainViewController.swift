//
//  WelcomeMainViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 8/8/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class WelcomeMainViewController: UIViewController{
    
    
    @IBOutlet weak var getStartedButton: UIButton!
    private(set) lazy var orderedViewControllers: [UIViewController] = { return [self.newViewController(number:"One"), self.newViewController(number:"Two"), self.newViewController(number:"Three")]}()
    
    private func newViewController(number: String) -> UIViewController{
        return UIStoryboard(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: "Welcome\(number)ViewController")
    }
    
    var pageViewController: UIPageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //style button
        getStartedButton.layer.cornerRadius = 4

        //load the page view controller and set first view controller
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = UIColor(red:0.67, green:0.00, blue:0.00, alpha:1.0)
        if let firstViewController = orderedViewControllers.first{
            self.pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        //change page view height to show get started button
        pageViewController.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 75)
        self.view.addSubview(pageViewController.view)
    }


    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "CollectUserInfo", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
        
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    }
}

//MARK: UIPageViewControllerDataSource

extension WelcomeMainViewController: UIPageViewControllerDataSource{
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
        guard let firstViewController = pageViewController.viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else{
            return 0
        }
        return firstViewControllerIndex
    }
}
