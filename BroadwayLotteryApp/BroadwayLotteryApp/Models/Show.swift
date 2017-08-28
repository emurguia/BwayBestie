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
    let canEnterWeekly: Bool
    
    init(title: String, lotteryOpen: Date, lotteryCloseEve: Date, lotteryCloseMat: Date, lotteryURL: String, notificationsOn: Bool, canEnterWeekly: Bool) {
        self.title = title
        self.lotteryOpen = lotteryOpen
        self.lotteryCloseEve = lotteryCloseEve
        self.lotteryCloseMat = lotteryCloseMat
        self.lotteryURL = lotteryURL
        self.notificationsOn = notificationsOn
        self.canEnterWeekly = canEnterWeekly
    }
    
    
    //function to determine if the lottery is currently open
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
        
        //lotteries are always open for weekly lotteries
        if canEnterWeekly == true{
            return true
        }
        
        if let currentHour = dateComponents.hour, let currentMinute = dateComponents.minute, let lotteryOpenHour = lotteryOpenDateComponents.hour, let lotteryOpenMinute = lotteryOpenDateComponents.minute, let lotteryCloseHour = lotteryCloseDateComponents.hour, let lotteryCloseMinute = lotteryCloseDateComponents.minute{
            
            return checkLottery(currentHour: currentHour, currentMinute: currentMinute, lotteryOpenHour: lotteryOpenHour, lotteryOpenMinute: lotteryOpenMinute, lotteryCloseHour: lotteryCloseHour, lotteryCloseMinute: lotteryCloseMinute)
        }
        
        return nil
    }
    
    //determine if lottery is currently open
    func checkLottery(currentHour: Int, currentMinute: Int, lotteryOpenHour: Int, lotteryOpenMinute: Int, lotteryCloseHour: Int, lotteryCloseMinute: Int) -> Bool{
        var lotteryIsOpen: Bool
        
        //issue: open: 5:00 pm, close 11:00 am, currently: 10:00 am
        //issue: open: 8:00 pm, close 2:00 pm, currently: 1:00 pm
        
        if currentHour >= lotteryCloseHour && currentHour < lotteryOpenHour {
            //lottery is closed
            lotteryIsOpen = false
            return lotteryIsOpen
        }else if currentHour >= lotteryCloseHour && currentHour > lotteryOpenHour{
            //ex. currently 10:00, opens at 4, closes at 6
            if lotteryOpenHour < lotteryCloseHour{
                lotteryIsOpen = false
                return lotteryIsOpen
            }else{
                //ex.lottery opens at 4:00 pm (16:00) , lottery closes at 5:30 am , current time is 5:47 pm  (17:47)
                lotteryIsOpen = true
                return lotteryIsOpen
            }
        }else if currentHour < lotteryCloseHour && currentHour < lotteryOpenHour{
            //ex. currently 2:00, opens at 4, closes at 6
            if lotteryOpenHour > lotteryCloseHour{
                //ex. open at 8:00 pm, closes at 1:00 pm the following day 
                lotteryIsOpen = true
                return lotteryIsOpen
            }else{
                lotteryIsOpen = false
                return lotteryIsOpen
            }
        }else{
            //lottery is open
            lotteryIsOpen = true
            return lotteryIsOpen
        }
    }
    

}






