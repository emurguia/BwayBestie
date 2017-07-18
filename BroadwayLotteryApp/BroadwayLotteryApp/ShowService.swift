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
 * 1) add Title and Lottery URL to Constants
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
    
    
    enum allShows:Int{
        case aladdin
        case anastasia
        case bookOfMormon
        case cats
        case dearEvanHansen
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
                return Show(title: Constants.ShowTitle.aladdin, lotteryOpen: Constants.LotteryOpen.aladdinOpen, lotteryCloseEve: Constants.LotteryCloseEve.aladdinCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.aladdinCloseMat, lotteryURL: Constants.LotteryURLs.aladdinURL)
            case .anastasia:
                return Show(title: Constants.ShowTitle.anastasia, lotteryOpen: Constants.LotteryOpen.anastasiaOpen, lotteryCloseEve: Constants.LotteryCloseEve.anastasiaCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.anastasiaCloseMat, lotteryURL: Constants.LotteryURLs.anastasiaURL)
            case .bookOfMormon:
                return Show(title: Constants.ShowTitle.bookOfMormon, lotteryOpen: Constants.LotteryOpen.bookOfMormonOpen, lotteryCloseEve: Constants.LotteryCloseEve.bookOfMormonCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.bookOfMormonCloseMat, lotteryURL: Constants.LotteryURLs.bookOfMoromonURL)
            case .cats:
                return Show(title: Constants.ShowTitle.cats, lotteryOpen: Constants.LotteryOpen.catsOpen, lotteryCloseEve: Constants.LotteryCloseEve.catsCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.catsCloseMat, lotteryURL: Constants.LotteryURLs.catsURL)
            case .dearEvanHansen:
                return Show(title: Constants.ShowTitle.dearEvanHansen, lotteryOpen: Constants.LotteryOpen.dearEvanHansenOpen, lotteryCloseEve: Constants.LotteryCloseEve.dearEvanHansenCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.dearEvanHansenCloseMat, lotteryURL: Constants.LotteryURLs.dearEvanHansenURL)
            case .greatComet:
                return Show(title: Constants.ShowTitle.greatComet, lotteryOpen: Constants.LotteryOpen.greatCometOpen, lotteryCloseEve: Constants.LotteryCloseEve.greatCometCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.greatCometCloseMat, lotteryURL: Constants.LotteryURLs.greatCometURL)
            case .groundhogDay:
                return Show(title: Constants.ShowTitle.groundhogDay, lotteryOpen: Constants.LotteryOpen.groundhogDayOpen, lotteryCloseEve: Constants.LotteryCloseEve.groundhogDayCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.groundhogDayCloseMat, lotteryURL: Constants.LotteryURLs.groundhogDayURL)
            case .hamilton:
                return Show(title: Constants.ShowTitle.hamilton, lotteryOpen: Constants.LotteryOpen.hamiltonOpen, lotteryCloseEve: Constants.LotteryCloseEve.hamiltonCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.hamiltonCloseMat, lotteryURL: Constants.LotteryURLs.hamiltonURL)
            case .kinkyBoots:
                return Show(title: Constants.ShowTitle.kinkyBoots, lotteryOpen: Constants.LotteryOpen.kinkyBootsOpen, lotteryCloseEve: Constants.LotteryCloseEve.kinkyBootsCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.kinkyBootsCloseMat, lotteryURL: Constants.LotteryURLs.kinkyBootsURL)
            case .lionKing:
                return Show(title: Constants.ShowTitle.lionKing, lotteryOpen: Constants.LotteryOpen.lionKingOpen, lotteryCloseEve: Constants.LotteryCloseEve.lionKingCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.lionKingCloseMat, lotteryURL: Constants.LotteryURLs.lionKingURL)
            case .onYourFeet:
                return Show(title: Constants.ShowTitle.onYourFeet, lotteryOpen: Constants.LotteryOpen.onYourFeetOpen, lotteryCloseEve: Constants.LotteryCloseEve.onYourFeetCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.onYourFeetCloseMat, lotteryURL: Constants.LotteryURLs.onYourFeetURL)
            case .oslo:
                return Show(title: Constants.ShowTitle.oslo, lotteryOpen: Constants.LotteryOpen.osloOpen, lotteryCloseEve: Constants.LotteryCloseEve.osloCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.osloCloseMat, lotteryURL: Constants.LotteryURLs.osloURL)
            case .phantom:
                return Show(title: Constants.ShowTitle.phantom, lotteryOpen: Constants.LotteryOpen.phantomOpen, lotteryCloseEve: Constants.LotteryCloseEve.phantomCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.phantomCloseMat, lotteryURL: Constants.LotteryURLs.phantomURL)
            case .schoolOfRock:
                return Show(title: Constants.ShowTitle.schoolOfRock, lotteryOpen: Constants.LotteryOpen.schoolOfRockOpen, lotteryCloseEve: Constants.LotteryCloseEve.schoolOfRockCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.schoolOfRockCloseMat, lotteryURL: Constants.LotteryURLs.schoolOfRockURL)
            case .warPaint:
                return Show(title: Constants.ShowTitle.warPaint, lotteryOpen: Constants.LotteryOpen.warPaintOpen, lotteryCloseEve: Constants.LotteryCloseEve.warPaintCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.warPaintCloseMat, lotteryURL: Constants.LotteryURLs.warPaintURL)
            case .wicked:
                return Show(title: Constants.ShowTitle.wicked, lotteryOpen: Constants.LotteryOpen.wickedOpen, lotteryCloseEve: Constants.LotteryCloseEve.wickedCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.wickedCloseMat, lotteryURL: Constants.LotteryURLs.wickedURL)
            default:
                return Show(title: "Broadway Baby!", lotteryOpen: "AM", lotteryCloseEve: "PM", lotteryCloseMat: "AM", lotteryURL: "wwww.broadway.com")
            }
        }
    }
    
    //function to get all currently available shows
    static func getShows() -> [Show]{
        //fillLotteryTimes()
        var showArr = [Show]()
        for i in 0...allShows.count{
            if let currentShow = allShows(rawValue: i){
                showArr.append(currentShow.asShow())
            }
        }
        return showArr
    }
    
}
