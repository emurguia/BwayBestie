//
//  ShowService.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/17/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import Foundation

/*
 * To add new show: 
 * 1) add Title to Constants.ShowInformation
 * 2) add lottery open/close times in fillLotteryTimes()
 * 3) add case to allShows enum 
 * 4) add to asShow() switch statement
 * 
 * To remove show: 
 * 1) delete case from allShows enum 
 *
 */

struct ShowService{
    
    static var lotteryOpen = [String: String]()
    static var lotteryCloseEve = [String: String]()
    static var lotteryCloseMat = [String: String]()
    
    static func fillLotteryTimes(){
        //lottery open
        lotteryOpen[Constants.ShowInformation.aladdin] = "7:00 pm"
        lotteryOpen[Constants.ShowInformation.anastasia] = "Midnight"
        lotteryOpen[Constants.ShowInformation.bookOfMormon] = "Week in Advance"
        lotteryOpen[Constants.ShowInformation.cats] = "10:00 am"
        lotteryOpen[Constants.ShowInformation.dearEvanHanson] = "10:00 am"
        lotteryOpen[Constants.ShowInformation.groundhogDay] = "Week in Advance"
        lotteryOpen[Constants.ShowInformation.hamilton] = "8:00 am"
        lotteryOpen[Constants.ShowInformation.kinkyBoots] = "Week in Advance"
        lotteryOpen[Constants.ShowInformation.lionKing] = "7:00 pm"
        lotteryOpen[Constants.ShowInformation.greatComet] = "Midnight"
        lotteryOpen[Constants.ShowInformation.onYourFeet] = "9:00 am"
        lotteryOpen[Constants.ShowInformation.oslo] = "Week in Advance"
        lotteryOpen[Constants.ShowInformation.phantom] = "9:00 am"
        lotteryOpen[Constants.ShowInformation.schoolOfRock] = "10:00 am"
        lotteryOpen[Constants.ShowInformation.warPaint] = "9:00 am"
        lotteryOpen[Constants.ShowInformation.wicked] = "8:00 pm"
        
        
        //lottery close -- evening
        lotteryCloseEve[Constants.ShowInformation.aladdin] = "8:30 am"
        lotteryCloseEve[Constants.ShowInformation.anastasia] = "2:00 pm"
        lotteryCloseEve[Constants.ShowInformation.bookOfMormon] = "11:00 am day prior"
        lotteryCloseEve[Constants.ShowInformation.cats] = "3:00 pm"
        lotteryCloseEve[Constants.ShowInformation.dearEvanHanson] = "3:00 pm"
        lotteryCloseEve[Constants.ShowInformation.groundhogDay] = "11:00 am day prior"
        lotteryCloseEve[Constants.ShowInformation.hamilton] = "9:00 am"
        lotteryCloseEve[Constants.ShowInformation.kinkyBoots] = "11 am day prior"
        lotteryCloseEve[Constants.ShowInformation.lionKing] = "9:00 am"
        lotteryCloseEve[Constants.ShowInformation.greatComet] = "3:00 pm"
        lotteryCloseEve[Constants.ShowInformation.onYourFeet] = "3:00 pm"
        lotteryCloseEve[Constants.ShowInformation.oslo] = "10:00 am day prior"
        lotteryCloseEve[Constants.ShowInformation.phantom] = "3:00 pm"
        lotteryCloseEve[Constants.ShowInformation.schoolOfRock] = "3:00 pm"
        lotteryCloseEve[Constants.ShowInformation.warPaint] = "3:00 pm"
        lotteryCloseEve[Constants.ShowInformation.wicked] = "2:00 pm"
        
    }
    
    enum allShows:Int{
        case aladdin
        case anastasia
        case bookOfMormon
        case cats
        case dearEvanHanson
        case greatComet
        case groundhogDay
        case hamilton
        case kinkyBoots
        case lionKing
        case onYourFeet
        case oslo
        case phantom
        case schoolOfRock
        case warPaint
        case wicked
        
        //get number of currently available shows
        static let count: Int = {
            var max: Int = 0
            while let _ = allShows(rawValue: max){ max += 1}
            return max
        }()
        
        //returns a Show object for each case in enum
        func asShow() -> Show{
            switch self{
            case .aladdin:
                return Show(title: Constants.ShowInformation.aladdin, lotteryOpen: lotteryOpen[Constants.ShowInformation.aladdin]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.aladdin]!)
            case .anastasia:
                return Show(title: Constants.ShowInformation.anastasia, lotteryOpen: lotteryOpen[Constants.ShowInformation.anastasia]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.anastasia]!)
            case .bookOfMormon:
                return Show(title: Constants.ShowInformation.bookOfMormon, lotteryOpen: lotteryOpen[Constants.ShowInformation.bookOfMormon]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.bookOfMormon]!)
            case .cats:
                return Show(title: Constants.ShowInformation.cats, lotteryOpen: lotteryOpen[Constants.ShowInformation.cats]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.cats]!)
            case .dearEvanHanson:
                return Show(title: Constants.ShowInformation.dearEvanHanson, lotteryOpen: lotteryOpen[Constants.ShowInformation.dearEvanHanson]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.dearEvanHanson]!)
            case .greatComet:
                return Show(title: Constants.ShowInformation.greatComet, lotteryOpen: lotteryOpen[Constants.ShowInformation.greatComet]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.greatComet]!)
            case .groundhogDay:
                return Show(title: Constants.ShowInformation.groundhogDay, lotteryOpen: lotteryOpen[Constants.ShowInformation.groundhogDay]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.groundhogDay]!)
            case .hamilton:
                return Show(title: Constants.ShowInformation.hamilton, lotteryOpen: lotteryOpen[Constants.ShowInformation.hamilton]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.hamilton]!)
            case .kinkyBoots:
                return Show(title: Constants.ShowInformation.kinkyBoots, lotteryOpen: lotteryOpen[Constants.ShowInformation.kinkyBoots]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.kinkyBoots]!)
            case .lionKing:
                return Show(title: Constants.ShowInformation.lionKing, lotteryOpen: lotteryOpen[Constants.ShowInformation.lionKing]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.lionKing]!)
            case .onYourFeet:
                return Show(title: Constants.ShowInformation.onYourFeet, lotteryOpen: lotteryOpen[Constants.ShowInformation.onYourFeet]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.onYourFeet]!)
            case .oslo:
                return Show(title: Constants.ShowInformation.oslo, lotteryOpen: lotteryOpen[Constants.ShowInformation.oslo]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.oslo]!)
            case .phantom:
                return Show(title: Constants.ShowInformation.phantom, lotteryOpen: lotteryOpen[Constants.ShowInformation.phantom]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.phantom]!)
            case .schoolOfRock:
                return Show(title: Constants.ShowInformation.schoolOfRock, lotteryOpen: lotteryOpen[Constants.ShowInformation.schoolOfRock]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.schoolOfRock]!)
            case .warPaint:
                return Show(title: Constants.ShowInformation.warPaint, lotteryOpen: lotteryOpen[Constants.ShowInformation.warPaint]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.warPaint]!)
            case .wicked:
                return Show(title: Constants.ShowInformation.wicked, lotteryOpen: lotteryOpen[Constants.ShowInformation.wicked]!, lotteryClose: lotteryCloseEve[Constants.ShowInformation.wicked]!)
            default:
                return Show(title: "Amazing New Show", lotteryOpen: "AM", lotteryClose: "PM")
            }
        }
    }
    
    //function to get all currently available shows
    static func getShows() -> [Show]{
        fillLotteryTimes()
        var showArr = [Show]()
        for i in 0...allShows.count{
            if let currentShow = allShows(rawValue: i){
                showArr.append(currentShow.asShow())
            }
        }
        return showArr
    }
    
}
