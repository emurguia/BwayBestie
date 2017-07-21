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
    
    
    
    //enable open notification for one show
    static func setOpenShowNotification(currentShow: Show){
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
        
        var trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //check timezone
        let easternTimeZone = TimeZone(identifier: "America/New_York")
        if TimeZone.autoupdatingCurrent != easternTimeZone{
            
            if let dateComponentsLocal = convertToLocalTime(dateComponents: dateComponents, timeZone: TimeZone.autoupdatingCurrent){
                trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsLocal,
                                                        repeats: true)
            }
        }
        
        
      
        //schedule
        //right now showing double -- might change id back to just title?
        let id = currentShow.title
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
    }
    
    //enable close notification for one show
    static func setCloseShowNotification(currentShow: Show){
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
        let id = currentShow.title + "close"
        let closeRequest = UNNotificationRequest(identifier: id, content: contentClose, trigger: triggerClose)
        
        let center = UNUserNotificationCenter.current()
        center.add(closeRequest, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
        
    }

    //enable notifications for all shows
    static func setAllNotifications(){
        let shows = ShowService.getShows()
        //setShowNotification(currentShow: shows[0])
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        for show in shows{
            setOpenShowNotification(currentShow: show)
            setCloseShowNotification(currentShow: show)
        }
    }
    
    //disable notifications for one show
    static func removeShowNotification(currentShow: Show){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [currentShow.title, currentShow.title + "close"])
    }
    
    
    //disable notifications for all shows 
    static func removeAllNotifications(){
        let shows = ShowService.getShows()
        for show in shows{
            removeShowNotification(currentShow: show)
        }
    }
    
    //function to convert to local times 
    static func convertToLocalTime(dateComponents: DateComponents, timeZone: TimeZone) -> DateComponents?{
        var newDateComponents = DateComponents()
        
        if let easternTimeZone = TimeZone(identifier: "America/New_York"){
            let easternSecondsFromGMT = easternTimeZone.secondsFromGMT()
            let localTimeZoneSecondsFromGMT = timeZone.secondsFromGMT()
            
            let difference = easternSecondsFromGMT - localTimeZoneSecondsFromGMT
            let hour = (difference / (60 * 60))
            let minutes = difference % (60 * 60)
            print(minutes)
            //add minutes calculation?
            
            if difference > 0{
                var newHour = dateComponents.hour! - hour
                if newHour < 0{
                    newHour = 12 + newHour
                }
                newDateComponents.hour = newHour
                newDateComponents.minute = dateComponents.minute! - minutes
                
                return newDateComponents
            }else{
                var newHour = dateComponents.hour! + hour
                if newHour > 24{
                    newHour = newHour - 24
                }
                newDateComponents.hour = newHour
                newDateComponents.minute = dateComponents.minute! + minutes
                return newDateComponents
            }
        }
        
        return nil
    }
}
