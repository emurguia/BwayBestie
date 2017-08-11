//
//  AppDelegate.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/6/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import UserNotifications
import SideMenuController


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notificationDelegate = UYLNotificationDelegate()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.sharedManager().enable = true
        
        //set up initial view controller
        let defaults = UserDefaults.standard
        var storyboard: UIStoryboard
        if defaults.bool(forKey: Constants.UserDefaults.isLoggedIn) == true {
            storyboard = UIStoryboard(name: "LotteryHome", bundle: nil)
        }else{
            storyboard = UIStoryboard(name: "Welcome", bundle: nil)
        }
        
        let initialViewController = storyboard.instantiateInitialViewController()
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        
        //request access to notifications
        let center = UNUserNotificationCenter.current()
        center.delegate = notificationDelegate
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted{
                if defaults.bool(forKey: Constants.UserDefaults.notificationsOn) == false{
                    defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)
                }
            }else{
                defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)
            }
        }
        
        //get rid of notifications for expired shows
        let shows = ShowService.getShows()
        center.getPendingNotificationRequests(completionHandler: { requests in
            var ids = [String]()
            for request in requests{
                ids.append(request.identifier)
            }
            
            var found: Bool = false
            for id in ids{
                found = false
                for show in shows{
                    if show.title == id{
                        found = true
                        break
                    }
                    
                    let closeID = show.title + "close"
                    if closeID == id{
                        found = true
                        break
                    }
                }
                if found == false{
                    center.removePendingNotificationRequests(withIdentifiers: [id])
                }
            }
        })

        //navigation bar appereance
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.isTranslucent = true
        navigationBarAppearace.barTintColor = UIColor(red:0.46, green:0.00, blue:0.00, alpha:1.0)
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "Avenir", size: 16)!]

        let attr = NSDictionary(object: UIFont(name: "Avenir", size: 16.0)!, forKey: NSFontAttributeName as NSCopying)
        UISegmentedControl.appearance().setTitleTextAttributes(attr as [NSObject : AnyObject] , for: .normal)
        
        //configure side menu
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "Hamburger_Menusidespace")
        SideMenuController.preferences.drawing.sidePanelPosition = .overCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 300
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .showUnderlay
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
      //  UserDefaults.standard.synchronize()

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.timeZoneDidChange),
            name: .NSSystemTimeZoneDidChange,
            object: nil)
    
    }
    
    func timeZoneDidChange(){
        //remove all notifications and reset with new timezone
        UNUserNotificationCenter.current().getPendingNotificationRequests(completionHandler: { requests in
            for request in requests{
                //remove notification with time in previous time zone
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [request.identifier])
                //add notitfication with new time 
                NotificationService.setNotificationID(identifer: request.identifier)
            }
        })
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        //UserDefaults.standard.synchronize()
    }


}

