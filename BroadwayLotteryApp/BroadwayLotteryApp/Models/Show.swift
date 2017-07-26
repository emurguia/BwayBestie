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
    
    
    

}


    

    
    
