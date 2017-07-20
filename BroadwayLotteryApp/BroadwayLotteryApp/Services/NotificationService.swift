//
//  NotificationService.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/19/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import Foundation
import UserNotifications

struct NotificationService{
    
    //enable notications for one show
    static func setShowNotification(currentShow: Show){
        
        /*
         * set up lottery open notifcation
         */
        
        //set up content
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey:
            currentShow.title, arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey:
            "The Lottery for \(currentShow.title) has opened!", arguments: nil)

        content.sound = UNNotificationSound.default()

        //set up trigger time
        var dateComponents = DateComponents()
        dateComponents.hour = Calendar.current.component(.hour, from: currentShow.lotteryOpen)
        dateComponents.minute = Calendar.current.component(.minute, from: currentShow.lotteryOpen)
        dateComponents.second = 0

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
                                                    repeats: true)
      
        //schedule
        let request = UNNotificationRequest(identifier: currentShow.title, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
        
        /*
         * set up lottery close notifcation
         */
        
        //set up content 
        let contentClose = UNMutableNotificationContent()
        contentClose.title = NSString.localizedUserNotificationString(forKey: currentShow.title, arguments: nil)
        contentClose.body = NSString.localizedUserNotificationString(forKey: "The lottery for \(currentShow.title) just closed -- check your email soon for results!", arguments: nil)
        
        contentClose.sound = UNNotificationSound.default()
        
        //set up trigger time 
        var dateComponentsClose = DateComponents()
        dateComponentsClose.hour = Calendar.current.component(.hour, from: currentShow.lotteryCloseEve)
        dateComponentsClose.minute = Calendar.current.component(.minute, from: currentShow.lotteryCloseEve)
        dateComponentsClose.second = 0
        
        let triggerClose = UNCalendarNotificationTrigger(dateMatching: dateComponentsClose, repeats: true)
        
        //schedule 
        let closeRequest = UNNotificationRequest(identifier: currentShow.title, content: contentClose, trigger: triggerClose)
        center.add(closeRequest, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
        
    }
    
    //disable notifications for one show
    static func removeShowNotification(currentShow: Show){
        
    }
    
    //enable notifications for all shows
    static func setAllNotifications(){
        let shows = ShowService.getShows()
        //setShowNotification(currentShow: shows[0])
        for show in shows{
            setShowNotification(currentShow: show)
        }
    
    }
}
