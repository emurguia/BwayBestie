//
//  Show.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/11/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import Foundation

class Show{
    
    //MARK: Properties 
    let title: String
    let lotteryOpen: Date
    let lotteryCloseEve: Date
    let lotteryCloseMat: Date
    let lotteryURL: String
    var notificationsOn: Bool
    
    init(title: String, lotteryOpen: Date, lotteryCloseEve: Date, lotteryCloseMat: Date, lotteryURL: String, notificationsOn: Bool) {
        self.title = title
        self.lotteryOpen = lotteryOpen
        self.lotteryCloseEve = lotteryCloseEve
        self.lotteryCloseMat = lotteryCloseMat
        self.lotteryURL = lotteryURL
        self.notificationsOn = notificationsOn
    }
    
    
    //function to determine if the lottery is currently open -- will probably need a return value
    func lotteryIsOpen() -> Bool?{
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.hour = Calendar.current.component(.hour, from: currentDate)
        dateComponents.minute = Calendar.current.component(.minute, from: currentDate)
        
        //lottery open
        var lotteryOpenDateComponents = DateComponents()
        lotteryOpenDateComponents.hour = Calendar.current.component(.hour, from: lotteryOpen)
        lotteryOpenDateComponents.minute = Calendar.current.component(.minute, from: lotteryOpen)
        
        //lottery close
        var lotteryCloseDateComponents = DateComponents()
        lotteryCloseDateComponents.hour = Calendar.current.component(.hour, from: lotteryCloseEve)
        lotteryCloseDateComponents.minute = Calendar.current.component(.minute, from: lotteryCloseEve)
        
        
        let easternTimeZone = TimeZone(identifier: "America/New_York")
        if TimeZone.autoupdatingCurrent != easternTimeZone{
            //convert to local time
            let conversionResultOpen = NotificationService.convertToLocalTime(dateComponents: lotteryOpenDateComponents, timeZone: TimeZone.autoupdatingCurrent)
            let conversionResultClose = NotificationService.convertToLocalTime(dateComponents: lotteryCloseDateComponents, timeZone: TimeZone.autoupdatingCurrent)
            if let currentHour = dateComponents.hour, let currentMinute = dateComponents.minute, let lotteryOpenHour = conversionResultOpen?.hour, let lotteryOpenMinute = conversionResultOpen?.minute, let lotteryCloseHour = conversionResultClose?.hour, let lotteryCloseMinute = conversionResultClose?.minute{
                
                return checkLottery(currentHour: currentHour, currentMinute: currentMinute, lotteryOpenHour: lotteryOpenHour, lotteryOpenMinute: lotteryOpenMinute, lotteryCloseHour: lotteryCloseHour, lotteryCloseMinute: lotteryCloseMinute)
            }
        }else{
            //no conversion necessary
            if let currentHour = dateComponents.hour, let currentMinute = dateComponents.minute, let lotteryOpenHour = lotteryOpenDateComponents.hour, let lotteryOpenMinute = lotteryOpenDateComponents.minute, let lotteryCloseHour = lotteryCloseDateComponents.hour, let lotteryCloseMinute = lotteryCloseDateComponents.minute{
                
                return checkLottery(currentHour: currentHour, currentMinute: currentMinute, lotteryOpenHour: lotteryOpenHour, lotteryOpenMinute: lotteryOpenMinute, lotteryCloseHour: lotteryCloseHour, lotteryCloseMinute: lotteryCloseMinute)
            }
        }
        
        return nil
    }
    
    //will probably need to return
    func checkLottery(currentHour: Int, currentMinute: Int, lotteryOpenHour: Int, lotteryOpenMinute: Int, lotteryCloseHour: Int, lotteryCloseMinute: Int) -> Bool{
        
        var lotteryIsOpen: Bool
        
        print("current time is \(currentHour):\(currentMinute)")
        print("lottery opens at \(lotteryOpenHour):\(lotteryOpenMinute)")
        print("lottery closes at \(lotteryCloseHour):\(lotteryCloseMinute)")
        
//        Book of Mormon
//        current time is 10:51
//        lottery opens at 9:0
//        lottery closes at 9:30
//        lottery is OPEN
        
//        The Phantom of the Opera
//        current time is 10:53
//        lottery opens at 4:1
//        lottery closes at 6:0
//        lottery is OPEN
//        
        
//        School of Rock
//        current time is 10:53
//        lottery opens at 9:1
//        lottery closes at 11:0
//        lottery is OPEN -- but setting label as Lottery Closed??
        
        if currentHour >= lotteryCloseHour && currentHour < lotteryOpenHour {
            //lottery is closed
            lotteryIsOpen = false
            print("lottery is CLOSED")
            return lotteryIsOpen
        }else if currentHour >= lotteryCloseHour && currentHour > lotteryOpenHour{
            //ex. currently 10:00, opens at 4, closes at 6
            lotteryIsOpen = false
            print("lottery is CLOSED")
            return lotteryIsOpen
        }else if currentHour < lotteryCloseHour && currentHour < lotteryOpenHour{
            //ex. currently 2:00, opens at 4, closes at 6
            lotteryIsOpen = false
            print("lottery is CLOSED")
            return lotteryIsOpen
        }else{
            //lottery is open
            lotteryIsOpen = true
            print("lottery is OPEN")
            return lotteryIsOpen
        }
    }
    

}






