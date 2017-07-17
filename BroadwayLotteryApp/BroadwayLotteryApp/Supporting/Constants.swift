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
    
    struct ShowInformation{
        //show titles
        static let aladdin = "Aladdin"
        static let anastasia = "Anastasia"
        static let bookOfMormon = "Book of Mormon"
        static let cats = "Cats"
        static let dearEvanHanson = "Dear Evan Hanson"
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
        
        //lottery  times
        static let midnight = "Midnight"
        static let eightAM = "8:00 am"
        static let eigthThirtyAM = "8:30 am"
        static let nineAM = "9:00 am"
        static let tenAM = "10:00 am"
        static let threePM = "3:00 pm"
        static let eightPM = "8:00 pm"
        static let sevenPM = "7:00 pm"
        
    }
    
}
