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
        
        //show notifications are on / off 
       // static let notificationsGranted = "notificationsGranted"
        static let notificationsOn = "notificationsOn"
        static let autofillOn = "autofillOn"
        
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
        
//        static let aladdin = "Aladdin"
//        static let anastasia = "Anastasia"
//        static let bookOfMormon = "Book of Mormon"
//        static let cats = "Cats"
//        static let dearEvanHansen = "Dear Evan Hansen"
//        static let groundhogDay = "Groundhog Day - The Musical"
//        static let hamilton = "Hamilton - An American Musical"
//        static let kinkyBoots = "Kinky Boots"
//        static let lionKing = "The Lion King"
//        static let greatComet =  "Natasha, Pierre, and the Great Comet of 1812"
//        static let onYourFeet = "On Your Feet"
//        static let oslo =  "Oslo"
//        static let phantom = "The Phantom of the Opera"
//        static let schoolOfRock = "School of Rock"
//        static let warPaint = "War Paint"
//        static let wicked = "Wicked"
        
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
    }
    /* 
     * lottery times
     */
    
    
    //for setting notifications - 24 hour
    
    struct LotteryOpen{
        
        static let aladdinOpen: Date = setDate(hour: 19, minutes: 0)!
        static let anastasiaOpen: Date  = setDate(hour: 0, minutes: 1)!
        static let bookOfMormonOpen: Date  = setDate(hour: 0, minutes: 0)! //week in advance
        static let catsOpen: Date  = setDate(hour: 10, minutes: 0)!
        static let dearEvanHansenOpen: Date  = setDate(hour: 0, minutes: 1)!//change to 12:01
        static let groundhogDayOpen: Date  = setDate(hour: 0, minutes: 0)! //week in advance
        static let hamiltonOpen: Date  = setDate(hour: 8, minutes: 0)!
        static let kinkyBootsOpen: Date  = setDate(hour: 0, minutes: 0)! // week in advance
        static let lionKingOpen: Date  = setDate(hour: 20, minutes: 0)!
        static let greatCometOpen: Date  = setDate(hour: 0, minutes: 1)!
        static let onYourFeetOpen: Date  = setDate(hour: 8, minutes: 0)! //might be 9 sometimes
        static let osloOpen: Date  = setDate(hour: 9, minutes: 0)! //week in advance
        static let phantomOpen: Date  = setDate(hour: 7, minutes: 1)!
        static let schoolOfRockOpen: Date  = setDate(hour: 0, minutes: 1)!
        static let warPaintOpen: Date  = setDate(hour: 8, minutes: 0)! //might be 9 sometimes
        static let wickedOpen: Date  = setDate(hour: 20, minutes: 0)!
        
        static func setDate(hour: Int, minutes: Int) -> Date?{
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minutes
            let nextOccurance = Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!

            return nextOccurance
        }
    }
    
    struct LotteryCloseEve{
        static let aladdinCloseEve: Date =  setDate(hour: 8, minutes: 30)!
        static let anastasiaCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let bookOfMormonCloseEve: Date = setDate(hour: 12, minutes: 30)!
        static let catsCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let dearEvanHansenCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let groundhogDayCloseEve: Date = setDate(hour: 12, minutes: 30)!
        static let hamiltonCloseEve: Date = setDate(hour: 15, minutes: 0)!
        static let kinkyBootsCloseEve: Date   = setDate(hour: 12, minutes: 30)!
        static let lionKingCloseEve: Date  = setDate(hour: 9, minutes: 0)!
        static let greatCometCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let onYourFeetCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let osloCloseEve: Date   = setDate(hour: 10, minutes: 0)!
        static let phantomCloseEve: Date  = setDate(hour: 9, minutes: 0)!
        static let schoolOfRockCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let warPaintCloseEve: Date   = setDate(hour: 15, minutes: 0)!
        static let wickedCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        
        static func setDate(hour: Int, minutes: Int) -> Date?{
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minutes

            let nextOccurance = Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!
            
            return nextOccurance
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
            
            static func setDate(hour: Int, minutes: Int) -> Date?{
                var dateComponents = DateComponents()
                dateComponents.hour = hour
                dateComponents.minute = minutes
                
                let nextOccurance = Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!
                
                return nextOccurance
            }
            
        }
    
    struct LotteryURLs{
        static let aladdinURL = "https://lottery.broadwaydirect.com/show/aladdin/"
        static let anastasiaURL = "http://www.anastasiabroadwaylottery.com"
        static let bookOfMoromonURL = "http://www.luckyseat.com/book-of-mormon/"
        static let catsURL = "https://lottery.broadwaydirect.com/show/cats/"
        static let dearEvanHansenURL = "http://www.dearevanhansenlottery.com"
        static let groundhogDayURL = "http://www.luckyseat.com/groundhog-day/"
        static let hamiltonURL = "https://lottery.broadwaydirect.com/show/hamilton/"
        static let kinkyBootsURL = "http://www.luckyseat.com/kinky-boots/"
        static let lionKingURL = "https://lottery.broadwaydirect.com/show/the-lion-king/"
        static let greatCometURL = "http://greatcometbroadway.com/lottery.php"
        static let onYourFeetURL = "https://lottery.broadwaydirect.com/show/on-your-feet/"
        static let osloURL = "http://oslobroadwaylottery.com"
        static let phantomURL = "http://www.phantombroadwaylottery.com"
        static let schoolOfRockURL = "http://schoolofrocklottery.com"
        static let warPaintURL = "https://lottery.broadwaydirect.com/show/war-paint/"
        static let wickedURL = "https://lottery.broadwaydirect.com/show/wicked/"
        
        //lottery entry page for broadway direct lotteries 
        static let broadwayDirectEntry = "https://lottery.broadwaydirect.com/enter-lottery/?lottery"
    }
    
}
