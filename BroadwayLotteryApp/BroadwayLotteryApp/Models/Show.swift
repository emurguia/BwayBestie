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
    //let lotteryOpen: String
//    let lotteryCloseEve: String
//    let lotteryCloseMat: String
    let lotteryOpen: Double
    let lotteryCloseEve: Double
    let lotteryCloseMat: Double
    let lotteryURL: String
   // let lotteryCloseEvening: String
    
    init(title: String, lotteryOpen: Double, lotteryCloseEve: Double, lotteryCloseMat: Double, lotteryURL: String) {
        self.title = title
        self.lotteryOpen = lotteryOpen
        self.lotteryCloseEve = lotteryCloseEve
        self.lotteryCloseMat = lotteryCloseMat
        self.lotteryURL = lotteryURL
    }
    
    
    

}


    

    
    
