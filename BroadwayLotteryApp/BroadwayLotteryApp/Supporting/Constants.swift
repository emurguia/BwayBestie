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
    
    struct LotteryOpen{
        static let aladdinOpen = "7:00 pm"
        static let anastasiaOpen = "Midnight"
        static let bookOfMormonOpen = "Week in Advance"
        static let catsOpen = "10:00 am"
        static let dearEvanHansenOpen = "10:00 am"
        static let groundhogDayOpen = "Week in Advance"
        static let hamiltonOpen = "8:00 am"
        static let kinkyBootsOpen = "Week in Advance"
        static let lionKingOpen  = "7:00 pm"
        static let greatCometOpen = "Midnight"
        static let onYourFeetOpen = "9:00 am"
        static let osloOpen = "Week in Advance"
        static let phantomOpen = "9:00 am"
        static let schoolOfRockOpen = "10:00 am"
        static let warPaintOpen = "9:00 am"
        static let wickedOpen = "8:00 pm"
    }
    
    struct LotteryCloseEve{
        static let aladdinCloseEve = "8:30 am"
        static let anastasiaCloseEve = "2:00 pm"
        static let bookOfMormonCloseEve = "11:00 am day prior"
        static let catsCloseEve = "3:00 pm"
        static let dearEvanHansenCloseEve = "3:00 pm"
        static let groundhogDayCloseEve  = "11:00 am day prior"
        static let hamiltonCloseEve  = "9:00 am"
        static let kinkyBootsCloseEve  = "11 am day prior"
        static let lionKingCloseEve = "9:00 am"
        static let greatCometCloseEve = "3:00 pm"
        static let onYourFeetCloseEve = "3:00 pm"
        static let osloCloseEve  = "10:00 am day prior"
        static let phantomCloseEve = "3:00 pm"
        static let schoolOfRockCloseEve = "3:00 pm"
        static let warPaintCloseEve  = "3:00 pm"
        static let wickedCloseEve = "2:00 pm"

    }
    
    struct LotteryCloseMat{
        static let aladdinCloseMat = "8:30 am" //
        static let anastasiaCloseMat = "9:00 am"
        static let bookOfMormonCloseMat = "11:00 am day prior" //
        static let catsCloseMat = "11:00 am"
        static let dearEvanHansenCloseMat = "10:00 am"
        static let groundhogDayCloseMat  = "11:00 am day prior"//
        static let hamiltonCloseMat  = "9:00 am"//
        static let kinkyBootsCloseMat  = "11 am day prior"//
        static let lionKingCloseMat = "9:00 am"//
        static let greatCometCloseMat = "10:00 am"
        static let onYourFeetCloseMat = "3:00 pm"//
        static let osloCloseMat  = "10:00 am day prior"//
        static let phantomCloseMat = "10:00 am"
        static let schoolOfRockCloseMat = "10:00 am"
        static let warPaintCloseMat  = "3:00 pm"//
        static let wickedCloseMat = "10:30 am"
        
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
    }
    
}
