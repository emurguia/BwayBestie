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
 * 1) add Title, Lottery URL, Times to Constants
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
    
    enum allShows:Int{
        case aladdin
        case anastasia
        case beautiful
        case bookOfMormon
        case cher
        case dearEvanHansen
        case fairLady
        case frozen
        case hamilton
        case kong
        case kinkyBoots
        case lionKing
        case meanGirls
        case phantom
        case prettyWoman
        case schoolOfRock
        case springsteen
        case wicked
        

        
        //get number of currently available shows
        static let count: Int = {
            var max: Int = 0
            while let _ = allShows(rawValue: max){ max += 1}
            return max
        }()
        
        //returns a Show object for each case in enum
        func asShow() -> Show{
            var notifications: Bool = false
            let defaults = UserDefaults.standard
            if defaults.bool(forKey: Constants.UserDefaults.notificationsOn) == true{
                notifications = true
            }
            
            switch self{
            case .aladdin:
                return Show(title: Constants.ShowTitle.aladdin, lotteryOpen: Constants.LotteryOpen.aladdinOpen, lotteryCloseEve: Constants.LotteryCloseEve.aladdinCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.aladdinCloseMat, lotteryURL: Constants.LotteryURLs.aladdinURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.aladdinCanEnterWeekly)
            case .anastasia:
                return Show(title: Constants.ShowTitle.anastasia, lotteryOpen: Constants.LotteryOpen.anastasiaOpen, lotteryCloseEve: Constants.LotteryCloseEve.anastasiaCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.anastasiaCloseMat, lotteryURL: Constants.LotteryURLs.anastasiaURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.anastasiaCanEnterWeekly)
            case .beautiful:
                return Show(title: Constants.ShowTitle.beautiful, lotteryOpen: Constants.LotteryOpen.beautifulOpen, lotteryCloseEve: Constants.LotteryCloseEve.beautifulCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.beautifulCloseMat, lotteryURL: Constants.LotteryURLs.beautifulURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.beautifulCanEnterWeekly)
            case .bookOfMormon:
                return Show(title: Constants.ShowTitle.bookOfMormon, lotteryOpen: Constants.LotteryOpen.bookOfMormonOpen, lotteryCloseEve: Constants.LotteryCloseEve.bookOfMormonCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.bookOfMormonCloseMat, lotteryURL: Constants.LotteryURLs.bookOfMoromonURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.bookOfMormonCanEnterWeekly)
            case .cher:
                return Show(title: Constants.ShowTitle.cher, lotteryOpen: Constants.LotteryOpen.cherOpen, lotteryCloseEve: Constants.LotteryCloseEve.cherCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.cherCloseMat, lotteryURL: Constants.LotteryURLs.cherURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.cherCanEnterWeekly)
            case .dearEvanHansen:
                return Show(title: Constants.ShowTitle.dearEvanHansen, lotteryOpen: Constants.LotteryOpen.dearEvanHansenOpen, lotteryCloseEve: Constants.LotteryCloseEve.dearEvanHansenCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.dearEvanHansenCloseMat, lotteryURL: Constants.LotteryURLs.dearEvanHansenURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.dearEvanHansenCanEnterWeekly)
            case .fairLady:
                return Show(title: Constants.ShowTitle.fairLady, lotteryOpen: Constants.LotteryOpen.fairLadyOpen, lotteryCloseEve: Constants.LotteryCloseEve.fairLadyClose, lotteryCloseMat: Constants.LotteryCloseMat.fairLadyClose, lotteryURL: Constants.LotteryURLs.fairLadyURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.fairLadyCanEnterWeekly)
            case .frozen:
                return Show(title: Constants.ShowTitle.frozen, lotteryOpen: Constants.LotteryOpen.frozen, lotteryCloseEve: Constants.LotteryCloseEve.forzenCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.frozenCloseMat, lotteryURL: Constants.LotteryURLs.frozenURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.frozenCanEnterWeekly)
            case .hamilton:
                return Show(title: Constants.ShowTitle.hamilton, lotteryOpen: Constants.LotteryOpen.hamiltonOpen, lotteryCloseEve: Constants.LotteryCloseEve.hamiltonCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.hamiltonCloseMat, lotteryURL: Constants.LotteryURLs.hamiltonURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.hamiltonCanEnterWeekly)
            case .kong:
                return Show(title: Constants.ShowTitle.kong, lotteryOpen: Constants.LotteryOpen.kongOpen, lotteryCloseEve: Constants.LotteryCloseEve.kongCloseEve, lotteryCloseMat: Constants.LotteryCloseEve.kongCloseEve, lotteryURL: Constants.LotteryURLs.kongURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.kongCanEnterWeekly)
            
            case .kinkyBoots:
                return Show(title: Constants.ShowTitle.kinkyBoots, lotteryOpen: Constants.LotteryOpen.kinkyBootsOpen, lotteryCloseEve: Constants.LotteryCloseEve.kinkyBootsCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.kinkyBootsCloseMat, lotteryURL: Constants.LotteryURLs.kinkyBootsURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.kinkyBootsCanEnterWeekly)
            case .lionKing:
                return Show(title: Constants.ShowTitle.lionKing, lotteryOpen: Constants.LotteryOpen.lionKingOpen, lotteryCloseEve: Constants.LotteryCloseEve.lionKingCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.lionKingCloseMat, lotteryURL: Constants.LotteryURLs.lionKingURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.lionKingCanEnterWeekly)
            case .meanGirls:
                return Show(title: Constants.ShowTitle.meanGirls, lotteryOpen: Constants.LotteryOpen.meanGirlsOpen, lotteryCloseEve: Constants.LotteryCloseEve.meanGirlsClose, lotteryCloseMat: Constants.LotteryCloseMat.meanGirlsClose, lotteryURL: Constants.LotteryURLs.meanGirlsURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.meanGirlsCanEnterWeekly)
            case .phantom:
                return Show(title: Constants.ShowTitle.phantom, lotteryOpen: Constants.LotteryOpen.phantomOpen, lotteryCloseEve: Constants.LotteryCloseEve.phantomCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.phantomCloseMat, lotteryURL: Constants.LotteryURLs.phantomURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.phantomCanEnterWeekly)
            case .prettyWoman:
                return Show(title: Constants.ShowTitle.prettyWoman, lotteryOpen: Constants.LotteryOpen.prettyWomanOpen, lotteryCloseEve: Constants.LotteryCloseEve.prettyWomanCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.prettyWomanCloseMat, lotteryURL: Constants.LotteryURLs.prettyWomanURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.prettyWomanCanEnterWeekly)
            case .schoolOfRock:
                return Show(title: Constants.ShowTitle.schoolOfRock, lotteryOpen: Constants.LotteryOpen.schoolOfRockOpen, lotteryCloseEve: Constants.LotteryCloseEve.schoolOfRockCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.schoolOfRockCloseMat, lotteryURL: Constants.LotteryURLs.schoolOfRockURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.schoolOfRockCanEnterWeekly)
            case .springsteen:
                return Show(title: Constants.ShowTitle.springsteen, lotteryOpen: Constants.LotteryOpen.springsteenOpen, lotteryCloseEve: Constants.LotteryCloseEve.springsteenCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.springsteenCloseMat, lotteryURL: Constants.LotteryURLs.springsteenURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.springsteenCanEnterWeekly)
            case .wicked:
                return Show(title: Constants.ShowTitle.wicked, lotteryOpen: Constants.LotteryOpen.wickedOpen, lotteryCloseEve: Constants.LotteryCloseEve.wickedCloseEve, lotteryCloseMat: Constants.LotteryCloseMat.wickedCloseMat, lotteryURL: Constants.LotteryURLs.wickedURL, notificationsOn: notifications, canEnterWeekly: Constants.canEnterWeekly.wickedCanEnterWeekly)
//            default:
//                return Show(title: "Broadway Baby!", lotteryOpen: 0, lotteryCloseEve: 0, lotteryCloseMat: 0, lotteryURL: "wwww.broadway.com")
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
