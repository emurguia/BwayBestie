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
    
//    struct LotteryOpen{
//        static let aladdinOpen = "7:00 pm"
//        static let anastasiaOpen = "Midnight"
//        static let bookOfMormonOpen = "Week in Advance"
//        static let catsOpen = "10:00 am"
//        static let dearEvanHansenOpen = "10:00 am"
//        static let groundhogDayOpen = "Week in Advance"
//        static let hamiltonOpen = "8:00 am"
//        static let kinkyBootsOpen = "Week in Advance"
//        static let lionKingOpen  = "7:00 pm"
//        static let greatCometOpen = "Midnight"
//        static let onYourFeetOpen = "9:00 am"
//        static let osloOpen = "Week in Advance"
//        static let phantomOpen = "9:00 am"
//        static let schoolOfRockOpen = "10:00 am"
//        static let warPaintOpen = "9:00 am"
//        static let wickedOpen = "8:00 pm"
//    }
//
//    
//    struct LotteryCloseEve{
//        static let aladdinCloseEve = "8:30 am"
//        static let anastasiaCloseEve = "2:00 pm"
//        static let bookOfMormonCloseEve = "11:00 am day prior"
//        static let catsCloseEve = "3:00 pm"
//        static let dearEvanHansenCloseEve = "3:00 pm"
//        static let groundhogDayCloseEve  = "11:00 am day prior"
//        static let hamiltonCloseEve  = "9:00 am"
//        static let kinkyBootsCloseEve  = "11 am day prior"
//        static let lionKingCloseEve = "9:00 am"
//        static let greatCometCloseEve = "3:00 pm"
//        static let onYourFeetCloseEve = "3:00 pm"
//        static let osloCloseEve  = "10:00 am day prior"
//        static let phantomCloseEve = "3:00 pm"
//        static let schoolOfRockCloseEve = "3:00 pm"
//        static let warPaintCloseEve  = "3:00 pm"
//        static let wickedCloseEve = "2:00 pm"
//
//    }
//    
//    struct LotteryCloseMat{
//        static let aladdinCloseMat = "8:30 am" //
//        static let anastasiaCloseMat = "9:00 am"
//        static let bookOfMormonCloseMat = "11:00 am day prior" //
//        static let catsCloseMat = "11:00 am"
//        static let dearEvanHansenCloseMat = "10:00 am"
//        static let groundhogDayCloseMat  = "11:00 am day prior"//
//        static let hamiltonCloseMat  = "9:00 am"//
//        static let kinkyBootsCloseMat  = "11 am day prior"//
//        static let lionKingCloseMat = "9:00 am"
//        static let greatCometCloseMat = "10:00 am"
//        static let onYourFeetCloseMat = "3:00 pm"//
//        static let osloCloseMat  = "10:00 am day prior"
//        static let phantomCloseMat = "10:00 am"
//        static let schoolOfRockCloseMat = "10:00 am"
//        static let warPaintCloseMat  = "3:00 pm"//
//        static let wickedCloseMat = "10:30 am"
//        
//    }
    
    //for setting notifications - 24 hour
    
    struct LotteryOpen{
        
        static let aladdinOpen: Date = setDate(hour: 19, minutes: 0)!
        static let anastasiaOpen: Date  = setDate(hour: 0, minutes: 0)!
        static let bookOfMormonOpen: Date  = setDate(hour: 9, minutes: 0)! //week in advance
        static let catsOpen: Date  = setDate(hour: 10, minutes: 0)!
        static let dearEvanHansenOpen: Date  = setDate(hour: 10, minutes: 0)!//10
        static let groundhogDayOpen: Date  = setDate(hour: 9, minutes: 0)! //week in advance
        static let hamiltonOpen: Date  = setDate(hour: 8, minutes: 0)!
        static let kinkyBootsOpen: Date  = setDate(hour: 9, minutes: 0)! // week in advance
        static let lionKingOpen: Date  = setDate(hour: 19, minutes: 0)!
        static let greatCometOpen: Date  = setDate(hour: 0, minutes: 0)!
        static let onYourFeetOpen: Date  = setDate(hour: 9, minutes: 0)!
        static let osloOpen: Date  = setDate(hour: 9, minutes: 0)! //week in advance
        static let phantomOpen: Date  = setDate(hour: 9, minutes: 0)!
        static let schoolOfRockOpen: Date  = setDate(hour: 10, minutes: 0)!
        static let warPaintOpen: Date  = setDate(hour: 9, minutes: 0)!
        static let wickedOpen: Date  = setDate(hour: 20, minutes: 0)!
        
        static func setDate(hour: Int, minutes: Int) -> Date?{
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minutes
            
            dateComponents.timeZone = TimeZone(identifier: "America/New_York")
            let nextOccurance = Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!

            return nextOccurance
        }
    }
    
    struct LotteryCloseEve{
        static let aladdinCloseEve: Date =  setDate(hour: 8, minutes: 30)! //8:30
        static let anastasiaCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        static let bookOfMormonCloseEve: Date = setDate(hour: 12, minutes: 30)!//12:30
        static let catsCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let dearEvanHansenCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let groundhogDayCloseEve: Date = setDate(hour: 12, minutes: 30)!
        static let hamiltonCloseEve: Date = setDate(hour: 9, minutes: 0)!
        static let kinkyBootsCloseEve: Date   = setDate(hour: 12, minutes: 30)!
        static let lionKingCloseEve: Date  = setDate(hour: 9, minutes: 0)!
        static let greatCometCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let onYourFeetCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let osloCloseEve: Date   = setDate(hour: 10, minutes: 0)!
        static let phantomCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let schoolOfRockCloseEve: Date  = setDate(hour: 15, minutes: 0)!
        static let warPaintCloseEve: Date   = setDate(hour: 15, minutes: 0)!
        static let wickedCloseEve: Date  = setDate(hour: 14, minutes: 0)!
        
        static func setDate(hour: Int, minutes: Int) -> Date?{
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minutes

            dateComponents.timeZone = TimeZone(identifier: "America/New_York")
            let nextOccurance = Calendar.current.nextDate(after: Date(), matching: dateComponents, matchingPolicy: .nextTime)!
            
            return nextOccurance
        }
        
    }
    
        struct LotteryCloseMat{
            static let aladdinCloseMat: Date  = setDate(hour: 9, minutes: 0)!//
            static let anastasiaCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let bookOfMormonCloseMat: Date  = setDate(hour: 12, minutes: 30)!//
            static let catsCloseMat: Date  = setDate(hour: 11, minutes: 0)!
            static let dearEvanHansenCloseMat: Date  = setDate(hour: 10, minutes: 0)!
            static let groundhogDayCloseMat: Date   = setDate(hour: 12, minutes: 30)!//
            static let hamiltonCloseMat: Date   = setDate(hour: 9, minutes: 0)!//
            static let kinkyBootsCloseMat: Date   = setDate(hour: 12, minutes: 30)!//
            static let lionKingCloseMat: Date  = setDate(hour: 9, minutes: 0)!
            static let greatCometCloseMat: Date  = setDate(hour: 10, minutes: 0)!
            static let onYourFeetCloseMat: Date  = setDate(hour: 15, minutes: 0)!//
            static let osloCloseMat: Date   = setDate(hour: 10, minutes: 0)!
            static let phantomCloseMat: Date  = setDate(hour: 10, minutes: 0)!
            static let schoolOfRockCloseMat: Date  = setDate(hour: 10, minutes: 0)!
            static let warPaintCloseMat: Date   = setDate(hour: 15, minutes: 0)!//
            static let wickedCloseMat: Date  = setDate(hour: 10, minutes: 30)!
            
            static func setDate(hour: Int, minutes: Int) -> Date?{
                var dateComponents = DateComponents()
                dateComponents.hour = hour
                dateComponents.minute = minutes
                
                dateComponents.timeZone = TimeZone(identifier: "America/New_York")
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
        static let broadwayDirectEntry = "https://lottery.broadwaydirect.com/enter-lottery/"
    }
    
}
