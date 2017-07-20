//
//  UYLNotificationDelegate.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/20/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import Foundation
import UserNotifications

class UYLNotificationDelegate: NSObject, UNUserNotificationCenterDelegate{
    
    /*func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //code
    }*/
    
    //handle notifcation while app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //play sound and show alert to user
        completionHandler([.alert,.sound])
    }
}
