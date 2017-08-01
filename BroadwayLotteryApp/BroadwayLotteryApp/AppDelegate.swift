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
        
        //set up notifications
        let center = UNUserNotificationCenter.current()
        center.delegate = notificationDelegate
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted{
                if defaults.bool(forKey: Constants.UserDefaults.notificationsOn) == false{
                    print("notifications granted")
                    //NotificationService.setAllNotifications()
                    //defaults.set(true, forKey: Constants.UserDefaults.notificationsOn)
                    defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)
                }
            }else{
                print("notifications NOT granted")
                defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)
            }
        }
        
        //get rid of notifications for expired shows
        let shows = ShowService.getShows()
//        for show in shows{
//            print(show.title)
//        }
        
        center.getPendingNotificationRequests(completionHandler: { requests in
           // print("entered completion handler")
            
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
                    print("removing notification for notifcation id: \(id)")
                    center.removePendingNotificationRequests(withIdentifiers: [id])
                }
//                if found == true{
//                    print("this notification is here to stay! \(id)")
//                }
            }
        })

        //navigation bar appereance
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barStyle = UIBarStyle.black
        navigationBarAppearace.isTranslucent = true
//        navigationBarAppearace.tintColor = UIColor.white
//        navigationBarAppearace.barTintColor = UIColor.lightGray
//        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
      //  UserDefaults.standard.synchronize()

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        //testing
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests(){ results in
            for result in results{
                print(result)
            }
        }
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
       
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        //UserDefaults.standard.synchronize()
    }


}

