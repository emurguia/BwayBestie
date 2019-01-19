//
//  Constants.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/11/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import Foundation

struct Constants{
    
    //keys for keychain 
    struct Keychain{
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let email = "email"
        static let zipCode = "zipCode"
        static let birthMonth = "birthMonth"
        static let birthDate = "birthDate"
        static let birthYear = "birthYear"
        static let numberTickets = "numberTickets"
        static let userAge = "userAge"
    }
    
    struct UserDefaults{
        static let isLoggedIn = "isLoggedIn"
        
        static let notificationsOn = "notificationsOn"
        static let closeNotificationsOn = "closeNotificationsOn"
        //static let autofillOn = "autofillOn"
        
        static let aladdinNotifications = "aladdinNotifications"
        static let anastasiaNotifications = "anastasiaNotifications"
        static let bookOfMormonNotifications = "bookOfMormonNotifications"
        static let catsNotifications = "catsNotifications"
        static let dearEvanHansenNotifications = "dearEvanHansenNotifications"
        static let groundhogDayNotifications = "groundhogDayNotifications"
        static let hamiltonNotifications = "hamiltonNotifications"
        static let kinkyBootsNotifications = "kinkyBootsNotifications"
        static let lionKingNotifications = "lionKingNotifications"
        static let greatCometNotifications = "greatCometNotifications"
        static let onYourFeetNotifications = "onYourFeetNotifications"
        static let osloNotifications = "osloNotifications"
        static let phantomNotifications = "phantomNotifications"
        static let schoolOfRockNotifications = "schoolOfRockNotifications"
        static let warPaintNotifications = "warPaintNotifications"
        static let wickedNotifications = "wickedNotifications"
        static let charlieNotifications = "charlieNotifications"
        static let springsteenNotifications = "springsteenNotifications"
        static let spongebobNotifications = "spongebobNotifications"
        static let frozenNotifications = "frozenNotifications"
        static let meanGirlsNotifcations = "meanGirlsNotifcations"
        static let summerNotifications = "summerNotifications"
        static let bronxNotifications = "bronxNotifications"
        static let fairLadyNotifications = "fairLadyNotifications"
        static let bandsVisitNotifications = "bandsVisitNotifications"
        static let beautifulNotifcations = "beautifulNotifcations"
        static let cherNotifications = "cherNotifications"
        static let kongNotifications = "kongNotifications"
        static let prettyWomanNotifications = "prettyWomanNotifications"
        
        static let aladdinFavorite = "aladdinFavorite"
        static let anastasiaFavorite = "anastasiaFavorite"
        static let bookOfMormonFavorite = "bookOfMormonFavorite"
        static let catsFavorite = "catsFavorite"
        static let dearEvanHansenFavorite = "dearEvanHansenFavorite"
        static let groundhogDayFavorite = "groundhogDayFavorite"
        static let hamiltonFavorite = "hamiltonFavorite"
        static let kinkyBootsFavorite = "kinkyBootsFavorite"
        static let lionKingFavorite = "lionKingFavorite"
        static let phantomFavorite = "phantomFavorite"
        static let schoolOfRockFavorite = "schoolOfRockFavorite"
        static let warPaintFavorite = "warPaintFavorite"
        static let wickedFavorite = "wickedFavorite"
        static let charlieFavorite = "charlieFavorite"
        static let springsteenFavorite = "springsteenFavorite"
        static let spongebobFavorite = "spongebobFavorite"
        static let frozenFavorite = "frozenFavorite"
        static let meanGirlsFavorite = "meanGirlsFavorite"
        static let summerFavorite = "summerFavorite"
        static let bronxFavorite = "bronxFavorite"
        static let fairLadyFavorite = "fairLadyFavorite"
        static let bandsVisitFavorite = "bandsVisitFavorite"
        static let beautifulFavorite = "beautifulFavorite"
        static let cherFavorite = "beautifulFavorite"
        static let kongFavorite = "kongFavorite"
        static let prettyWomanFavorite = "prettyWomanFavorite"
        
        
        static let aladdinEntered = "aladdinEntered"
        static let anastasiaEntered = "anastasiaEntered"
        static let bookOfMormonEntered = "bookOfMormonEntered"
        static let catsEntered = "catsEntered"
        static let dearEvanHansenEntered = "dearEvanHansenEntered"
        static let groundhogDayEntered = "groundhogDayEntered"
        static let hamiltonEntered = "hamiltonEntered"
        static let kinkyBootsEntered = "kinkyBootsEntered"
        static let lionKingEntered = "lionKingEntered"
        static let phantomEntered = "phantomEntered"
        static let schoolOfRockEntered = "schoolOfRockEntered"
        static let warPaintEntered = "warPaintEntered"
        static let wickedEntered = "wickedEntered"
        static let charlieEntered = "charlieEntered"
        static let springsteenEntered = "springsteenEntered"
        static let spongebobEntered = "spongebobEntered"
        static let frozenEntered = "frozenEntered"
        static let meanGirlsEntered = "meanGirlsEntered"
        static let summerEntered = "summerEntered"
        static let bronxEntered  = "bronxEntered"
        static let fairLadyEntered = "fairLadyEntered"
        static let bandsVisitEntered = "bandsVisitEntered"
        static let beautifulEntered = "beautifulEntered"
        static let cherEntered = "cherEntered"
        static let kongEntered = "kongEntered"
        static let prettyWomanEntered = "prettyWomanEntered"
    }
    
    struct ShowTitle{
        static let aladdin = "Aladdin"
        static let anastasia = "Anastasia"
        static let bookOfMormon = "Book of Mormon"
        static let cats = "Cats"
        static let dearEvanHansen = "Dear Evan Hansen"
        static let groundhogDay = "Groundhog Day - The Musical"
        static let hamilton = "Hamilton - An American Musical"
        static let kinkyBoots = "Kinky Boots"
        static let lionKing = "The Lion King"
        static let greatComet =  "Natasha, Pierre, and the Great Comet of 1812"
        static let onYourFeet = "On Your Feet"
        static let oslo =  "Oslo"
        static let phantom = "The Phantom of the Opera"
        static let schoolOfRock = "School of Rock"
        static let warPaint = "War Paint"
        static let wicked = "Wicked"
        static let charlie = "Charlie and the Chocolate Factory"
        static let springsteen = "Springsteen on Broadway"
        static let spongebob = "SpongeBob SquarePants, The New Musical"
        static let frozen = "Frozen"
        static let meanGirls = "Mean Girls"
        static let summer = "Summer: The Donna Summer Musical"
        static let bronx = "A Bronx Tale"
        static let fairLady = "My Fair Lady"
        static let bandsVisit = "The Band's Visit"
        static let beautiful = "Beautiful: A Carole King Musical"
        static let cher = "The Cher Show"
        static let kong = "King Kong"
        static let prettyWoman = "Pretty Woman: The Musical"
    }
    /* 
     * lottery times
     */
    
    struct LotteryOpen{
        
        static let aladdinOpen: Date = setDate(hour: 19, minutes: 0)!
        static let anastasiaOpen: Date  = setDate(hour: 0, minutes: 1)!
        static let bookOfMormonOpen: Date  = setDate(hour: 0, minutes: 0)! //week in advance
        static let catsOpen: Date  = setDate(hour: 10, minutes: 0)!
        static let dearEvanHansenOpen: Date  = setDate(hour: 0, minutes: 1)!//change to 12:01
        static let groundhogDayOpen: Date  = setDate(hour: 0, minutes: 0)! //week in advance
        static let hamiltonOpen: Date  = setDate(hour: 11, minutes: 0)!
        static let kinkyBootsOpen: Date  = setDate(hour: 0, minutes: 0)! // week in advance
        static let lionKingOpen: Date  = setDate(hour: 20, minutes: 0)!
        static let greatCometOpen: Date  = setDate(hour: 0, minutes: 1)!
        static let onYourFeetOpen: Date  = setDate(hour: 8, minutes: 0)! //might be 9 sometimes
        static let osloOpen: Date  = setDate(hour: 9, minutes: 0)! //week in advance
        static let phantomOpen: Date  = setDate(hour: 7, minutes: 1)!
        static let schoolOfRockOpen: Date  = setDate(hour: 0, minutes: 1)!
        static let warPaintOpen: Date  = setDate(hour: 8, minutes: 0)! //might be 9 sometimes
        static let wickedOpen: Date  = setDate(hour: 20, minutes: 0)!
        static let charlieOpen: Date = setDate(hour: 10, minutes: 0)!
        static let springsteenOpen: Date = setDate(hour: 0, minutes: 0)! //week in advance
        static let spongebobOpen: Date = setDate(hour: 7, minutes:0)!
        static let frozen: Date = setDate(hour: 0, minutes: 0)!//week in advance
        static let meanGirlsOpen: Date = setDate(hour: 0, minutes: 0)! //week
        static let summerOpen: Date = setDate(hour: 8, minutes: 0)!
        static let bronxOpen: Date = setDate(hour: 0, minutes: 0)!
        static let fairLadyOpen: Date = setDate(hour: 0, minutes: 0)!
        static let bandsVisitOpen: Date = setDate(hour: 0, minutes: 0)!
        static let beautifulOpen: Date = setDate(hour: 0, minutes: 0)!
        static let cherOpen: Date = setDate(hour: 8, minutes: 0)!
        static let kongOpen: Date = setDate(hour: 0, minutes: 0)!
        static let prettyWomanOpen: Date = setDate(hour: 9, minutes: 0)!
        
        static func setDate(hour: Int, minutes: Int) -> Date?{
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minutes
            let nextOccurance = Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!
            
            //convert to local time
            if let sourceTimeZone = TimeZone(identifier: "America/New_York"){
                let userTimeZone = TimeZone.current
                let sourceGMTOffset = sourceTimeZone.secondsFromGMT()
                let userGMTOffset = userTimeZone.secondsFromGMT()
                let interval = Double(userGMTOffset - sourceGMTOffset)
                
                let destinationDate = Date(timeInterval: interval, since: nextOccurance)
                return destinationDate
            }else{
                print("local time conversion failed")
                return nextOccurance
            }
        }
    }
    

    struct LotteryCloseEve{
        static let aladdinCloseEve: Date =  setDate(hour: 8, minutes: 30)!
        static let anastasiaCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let bookOfMormonCloseEve: Date = setDate(hour: 12, minutes: 30)!
        static let catsCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let dearEvanHansenCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let groundhogDayCloseEve: Date = setDate(hour: 12, minutes: 30)!
        static let hamiltonCloseEve: Date = setDate(hour: 9, minutes: 0)!
        static let kinkyBootsCloseEve: Date   = setDate(hour: 12, minutes: 30)!
        static let lionKingCloseEve: Date  = setDate(hour: 9, minutes: 0)!
        static let greatCometCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let onYourFeetCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let osloCloseEve: Date   = setDate(hour: 10, minutes: 0)!
        static let phantomCloseEve: Date  = setDate(hour: 9, minutes: 0)!
        static let schoolOfRockCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let warPaintCloseEve: Date   = setDate(hour: 15, minutes: 0)!
        static let wickedCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let charlieCloseEve: Date = setDate(hour: 14, minutes: 0)!
        static let springsteenCloseEve: Date = setDate(hour: 16, minutes: 0)!
        static let spongebobCloseEve: Date = setDate(hour: 15, minutes: 0)!
        static let forzenCloseEve: Date = setDate(hour: 11, minutes: 0)!
        static let meanGirlsClose: Date = setDate(hour: 11, minutes: 0)! //week
        static let summerClose: Date = setDate(hour: 15, minutes: 0)!
        static let bronxClose: Date = setDate(hour: 14, minutes: 0)!
        static let fairLadyClose: Date = setDate(hour: 14, minutes: 0)!
        static let bandsVisitClose: Date = setDate(hour: 14, minutes: 0)!
        static let beautifulCloseEve: Date = setDate(hour: 14, minutes: 0)!
        static let cherCloseEve: Date = setDate(hour: 14, minutes: 0)!
        static let kongCloseEve: Date = setDate(hour: 14, minutes: 0)!
        static let prettyWomanCloseEve: Date = setDate(hour: 14, minutes: 0)!
        
        static func setDate(hour: Int, minutes: Int) -> Date?{
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minutes

            let nextOccurance = Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!
            
            //convert to local time
            if let sourceTimeZone = TimeZone(identifier: "America/New_York"){
                let userTimeZone = TimeZone.current
                let sourceGMTOffset = sourceTimeZone.secondsFromGMT()
                let userGMTOffset = userTimeZone.secondsFromGMT()
                let interval = Double(userGMTOffset - sourceGMTOffset)
                
                let destinationDate = Date(timeInterval: interval, since: nextOccurance)
                return destinationDate
            }else{
                return nextOccurance
            }
        }
    }
    
        struct LotteryCloseMat{
            static let aladdinCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let anastasiaCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let bookOfMormonCloseMat: Date  = setDate(hour: 12, minutes: 30)!
            static let catsCloseMat: Date  = setDate(hour: 11, minutes: 0)!
            static let dearEvanHansenCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let groundhogDayCloseMat: Date   = setDate(hour: 12, minutes: 30)!
            static let hamiltonCloseMat: Date   = setDate(hour: 9, minutes: 0)!//
            static let kinkyBootsCloseMat: Date   = setDate(hour: 12, minutes: 30)!
            static let lionKingCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let greatCometCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let onYourFeetCloseMat: Date  = setDate(hour: 15, minutes: 0)!//
            static let osloCloseMat: Date   = setDate(hour: 10, minutes: 0)!
            static let phantomCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let schoolOfRockCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let warPaintCloseMat: Date   = setDate(hour: 15, minutes: 0)!//
            static let wickedCloseMat: Date  = setDate(hour: 10, minutes: 30)!
            static let charlieCloseMat: Date = setDate(hour: 9, minutes: 30)!
            static let springsteenCloseMat: Date = setDate(hour: 16, minutes:0)!
            static let spongebobCloseMat: Date = setDate(hour: 15, minutes: 0)!
            static let frozenCloseMat: Date = setDate(hour: 11, minutes: 0)!
            static let meanGirlsClose: Date = setDate(hour: 11, minutes: 0)! //week
            static let summerClose: Date = setDate(hour: 15, minutes: 0)!
            static let bronxClose: Date = setDate(hour: 14, minutes: 0)!
            static let fairLadyClose: Date = setDate(hour: 14, minutes: 0)!
            static let bandsVisitClose: Date = setDate(hour: 14, minutes: 0)!
            static let beautifulCloseMat: Date = setDate(hour: 14, minutes: 0)!
            static let cherCloseMat: Date = setDate(hour: 14, minutes: 0)!
            static let kongCloseMat: Date = setDate(hour: 14, minutes: 0)!
            static let prettyWomanCloseMat: Date = setDate(hour: 14, minutes: 0)!
            
            static func setDate(hour: Int, minutes: Int) -> Date?{
                var dateComponents = DateComponents()
                dateComponents.hour = hour
                dateComponents.minute = minutes
                
                let nextOccurance = Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!
                //convert to local time
                if let sourceTimeZone = TimeZone(identifier: "America/New_York"){
                    let userTimeZone = TimeZone.current
                    let sourceGMTOffset = sourceTimeZone.secondsFromGMT()
                    let userGMTOffset = userTimeZone.secondsFromGMT()
                    let interval = Double(userGMTOffset - sourceGMTOffset)
                    
                    let destinationDate = Date(timeInterval: interval, since: nextOccurance)
                    return destinationDate
                }else{
                    return nextOccurance
                }
            }
            
        }
    
    struct canEnterWeekly{
        static let aladdinCanEnterWeekly = false
        static let anastasiaCanEnterWeekly = false
        static let bookOfMormonCanEnterWeekly = true
        static let catsCanEnterWeekly = false
        static let dearEvanHansenCanEnterWeekly = false
        static let groundhogDayCanEnterWeekly = true
        static let hamiltonCanEnterWeekly = false
        static let kinkyBootsCanEnterWeekly = true
        static let lionKingCanEnterWeekly = false
        static let greatCometCanEnterWeekly = false
        static let onYourFeetCanEnterWeekly = false
        static let phantomCanEnterWeekly = false
        static let schoolOfRockCanEnterWeekly = false
        static let warPaintCanEnterWeekly = false
        static let wickedCanEnterWeekly = false
        static let charlieCanEnterWeekly = false
        static let springsteenCanEnterWeekly = true
        static let spongebobCanEnterWeekly = false
        static let frozenCanEnterWeekly = true
        static let meanGirlsCanEnterWeekly = true
        static let summerCanEnterWeekly = false
        static let bronxCanEnterWeekly = false
        static let fairLadyCanEnterWeekly = false
        static let bandsVisitCanEnterWeekly = false
        static let beautifulCanEnterWeekly = false
        static let cherCanEnterWeekly = false
        static let kongCanEnterWeekly = false
        static let prettyWomanCanEnterWeekly = false
    }
    
    // if HTTP, make sure to add to Info.plist
    
    struct LotteryURLs{
        static let aladdinURL = "https://lottery.broadwaydirect.com/show/aladdin/"
        static let anastasiaURL = "http://www.anastasiabroadwaylottery.com"
        static let bookOfMoromonURL = "http://www.luckyseat.com/book-of-mormon/"
        static let catsURL = "https://lottery.broadwaydirect.com/show/cats/"
        static let dearEvanHansenURL = "http://www.dearevanhansenlottery.com"
        static let groundhogDayURL = "http://www.luckyseat.com/groundhog-day/"
        static let hamiltonURL = "http://www.luckyseat.com/hamilton-ny/"
        static let kinkyBootsURL = "http://www.luckyseat.com/kinky-boots/"
        static let lionKingURL = "https://lottery.broadwaydirect.com/show/the-lion-king/"
        static let greatCometURL = "http://greatcometbroadway.com/lottery.php"
        static let onYourFeetURL = "https://lottery.broadwaydirect.com/show/on-your-feet/"
        static let osloURL = "http://oslobroadwaylottery.com"
        static let phantomURL = "http://www.phantombroadwaylottery.com"
        static let schoolOfRockURL = "http://schoolofrocklottery.com"
        static let warPaintURL = "https://lottery.broadwaydirect.com/show/war-paint/"
        static let wickedURL = "https://lottery.broadwaydirect.com/show/wicked/"
        static let charlieURL = "https://lottery.broadwaydirect.com/show/charlie/"
        static let springsteenURL = "http://www.luckyseat.com/springsteen-broadway/"
        static let spongebobURL = "https://lottery.broadwaydirect.com/show/sponge/"
        static let frozenURL = "https://www.luckyseat.com/frozen/"
        static let meanGirlsURL = "https://www.luckyseat.com/mean-girls/"
        static let summerURL = "https://lottery.broadwaydirect.com/show/summer/"
        static let fairLadyURL = "https://myfairladylottery.com"
        static let bronxURL = "http://www.abronxtalethemusical.com/lottery/"
        static let bandsVisitURL = "https://thebandsvisitlottery.com"
        static let beautifulURL = "https://beautifullottery.com/"
        static let cherURL = "https://lottery.broadwaydirect.com/show/cher/"
        static let kongURL = "https://kingkonglottery.com/"
        static let prettyWomanURL = "https://lottery.broadwaydirect.com/show/pretty/"
        
        //lottery entry page for broadway direct lotteries 
        static let broadwayDirectEntry = "https://lottery.broadwaydirect.com/enter-lottery/?lottery"
    }
    
}
