//
//  ShowService.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/17/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import Foundation

struct ShowService{
    
    
    //will need to refactor this -- get rid of strings and make it simpler to add/remove shows
    static func getShows() -> [Show]{
        //create Show variables 
        let aladdinShow = Show(title: "Aladdin", lotteryOpen: "7:00 pm", lotteryClose: "8:30 am")
        let anastasiaShow = Show(title: "Anastasia", lotteryOpen: "Midnight", lotteryClose: "2:00 pm")
        let bookOfMormonShow = Show(title: "Book of Mormon", lotteryOpen: "Week In Advance", lotteryClose: "11:00 am day prior")
        let catsShow = Show(title: "Cats", lotteryOpen: "10:00 am", lotteryClose: "3:00 pm")
        let dearEvanHansonShow = Show(title: "Dear Evan Hanson", lotteryOpen: "10:00 am", lotteryClose: "3:00 pm")
        let groundhogDayShow = Show(title: "Groundhog Day - The Musical", lotteryOpen: "Week in Advance", lotteryClose: "11:00 am day prior")
        let hamiltonShow = Show(title: "Hamilton - An American Musical", lotteryOpen: "8:00 am", lotteryClose: "3:00 pm")
        let kinkyBootsShow = Show(title: "Kinky Boots", lotteryOpen: "Week in Advance", lotteryClose: "11:00 am day prior")
        let lionKingShow = Show(title: "The Lion King", lotteryOpen: "7:00 pm", lotteryClose: "9:00 am")
        let greatCometShow = Show(title: "Natasha, Pierre, and the Great Comet of 1812", lotteryOpen: "Midnight", lotteryClose: "3:00 pm")
        let onYourFeetShow = Show(title: "On Your Feet", lotteryOpen: "9:00 am", lotteryClose: "3:00 pm")
        let osloShow = Show(title: "Oslo", lotteryOpen: "Week in Advance", lotteryClose: "10:00 am day prior")
        let phantomShow = Show(title: "The Phantom of the Opera", lotteryOpen: "9:00 am", lotteryClose: "3:00 pm")
        let schoolOfRockShow = Show(title: "Midnight", lotteryOpen: "10:00 am", lotteryClose: "3:00 pm")
        let warPaintShow = Show(title: "War Paint", lotteryOpen: "9:00 am", lotteryClose: "3:00 pm")
        let wickedShow = Show(title: "Wicked", lotteryOpen: "8:00 pm", lotteryClose: "2:00 pm")
        
        //put Shows into array 
        let showArr: [Show] = [aladdinShow, anastasiaShow, bookOfMormonShow, catsShow, dearEvanHansonShow, groundhogDayShow, hamiltonShow, kinkyBootsShow, lionKingShow, greatCometShow, onYourFeetShow, osloShow, phantomShow, schoolOfRockShow, warPaintShow, wickedShow]
        
        return showArr
        
    }
    
}
