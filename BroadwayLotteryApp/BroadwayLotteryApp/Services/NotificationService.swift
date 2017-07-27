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
        //content.title = NSString.localizedUserNotificationString(forKey: currentShow.title, arguments: nil)
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
            let conversionResult = convertToLocalTime(dateComponents: dateComponents, timeZone: TimeZone.autoupdatingCurrent)
            if let dateComponentsLocal = conversionResult.0 {
                trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsLocal,
                                                        repeats: true)
            }
        }
    
      
        //schedule
        //change back to + "open"
        let id = currentShow.title
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
        
        //set notification default 
        print("set user defaults for \(currentShow.title) to true")
    }
    
    //enable close notification for one show
    static func setCloseShowNotification(currentShow: Show){
        //set up content
        let content = UNMutableNotificationContent()
        //content.title = NSString.localizedUserNotificationString(forKey: currentShow.title, arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "The lottery for \(currentShow.title) just closed. Check your email for results!", arguments: nil)
        
        content.sound = UNNotificationSound.default()
        
        //set up trigger time
        var dateComponents = DateComponents()
        dateComponents.hour = Calendar.current.component(.hour, from: currentShow.lotteryCloseEve)
        dateComponents.minute = Calendar.current.component(.minute, from: currentShow.lotteryCloseEve)
        dateComponents.second = 0
        
        var trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //check timezone
        let easternTimeZone = TimeZone(identifier: "America/New_York")
        if TimeZone.autoupdatingCurrent != easternTimeZone{
            let conversionResult = convertToLocalTime(dateComponents: dateComponents, timeZone: TimeZone.autoupdatingCurrent)
            if let dateComponentsLocal = conversionResult.0{
                trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsLocal,
                                                        repeats: true)
            }
        }
        
        //schedule
        let id = currentShow.title + "close"
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
        
    }

    //enable notifications for all shows
    static func setAllNotifications(){
        let shows = ShowService.getShows()
        let center = UNUserNotificationCenter.current()
        //for testing
        center.removeAllPendingNotificationRequests()
        
        for show in shows{
            setOpenShowNotification(currentShow: show)
            setCloseShowNotification(currentShow: show)
            setNotificationDefault(currentShow: show, notificationsStatus: true)
        }
    }
    
    //disable notifications for one show
    static func removeShowNotification(currentShow: Show){
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [currentShow.title, currentShow.title + "close"])
        setNotificationDefault(currentShow: currentShow, notificationsStatus: false)
        print("set user defaults for \(currentShow.title) to false")

    }
    
    
    //disable notifications for all shows 
    static func removeAllNotifications(){
        let shows = ShowService.getShows()
        for show in shows{
            removeShowNotification(currentShow: show)
        }
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)

    }
    
    //function to convert to local times 
    static func convertToLocalTime(dateComponents: DateComponents, timeZone: TimeZone) -> (DateComponents?, Bool){
        var newDateComponents = DateComponents()
        var crossedMidnight: Bool = false
        
        if let easternTimeZone = TimeZone(identifier: "America/New_York"){
            let easternSecondsFromGMT = easternTimeZone.secondsFromGMT()
            let localTimeZoneSecondsFromGMT = timeZone.secondsFromGMT()
            
            let difference = easternSecondsFromGMT - localTimeZoneSecondsFromGMT
            let hour = (difference / (60 * 60))
            let minutes = difference % (60 * 60)
           // print(minutes)
            
            if difference > 0{
                //adjust time for time zones behind eastern
                var newHour = dateComponents.hour! - hour
                if newHour < 0{
                    newHour = 12 + newHour
                    crossedMidnight = true
                }
                newDateComponents.hour = newHour
                newDateComponents.minute = dateComponents.minute! - minutes
                
                return (newDateComponents, crossedMidnight)
            }else{
                //adjust time for time zones ahead of eastern
                var newHour = dateComponents.hour! + hour
                if newHour > 24{
                    newHour = newHour - 24
                    crossedMidnight = true
                }
                newDateComponents.hour = newHour
                newDateComponents.minute = dateComponents.minute! + minutes
                return (newDateComponents, crossedMidnight)
            }
        }
        
        return (nil, crossedMidnight)
    }
    
    static func setNotificationDefault(currentShow: Show, notificationsStatus: Bool){
        let defaults = UserDefaults.standard
        
        switch currentShow.title {
        case Constants.ShowTitle.aladdin:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.aladdinNotifications)
        case Constants.ShowTitle.anastasia:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.anastasiaNotifications)
        case Constants.ShowTitle.bookOfMormon:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.bookOfMormonNotifications)
        case Constants.ShowTitle.cats:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.catsNotifications)
        case Constants.ShowTitle.dearEvanHansen:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.dearEvanHansenNotifications)
        case Constants.ShowTitle.greatComet:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.greatCometNotifications)
        case Constants.ShowTitle.groundhogDay:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.groundhogDayNotifications)
        case Constants.ShowTitle.hamilton:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.hamiltonNotifications)
        case Constants.ShowTitle.kinkyBoots:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.kinkyBootsNotifications)
        case Constants.ShowTitle.lionKing:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.lionKingNotifications)
        case Constants.ShowTitle.onYourFeet:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.onYourFeetNotifications)
        case Constants.ShowTitle.oslo:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.osloNotifications)
        case Constants.ShowTitle.phantom:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.phantomNotifications)
        case Constants.ShowTitle.schoolOfRock:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.schoolOfRockNotifications)
        case Constants.ShowTitle.warPaint:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.warPaintNotifications)
        case Constants.ShowTitle.wicked:
            defaults.set(notificationsStatus, forKey: Constants.UserDefaults.wickedNotifications)
        default:
            print("error - show not found")
        }
    }

}
