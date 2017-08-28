//
//  LotteryHomeTableViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/11/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class LotteryHomeTableViewController: UITableViewController {
    
    //MARK -- Properties

    @IBOutlet weak var backgroundView: UIView!
    let shows = ShowService.getShows()
    let cacheIdentifier = "LotteryHomeViewController"
    var favoriteFilter: Bool?
    var openFilter: Bool?
    var weeklyFilter: Bool?
    var dailyFilter: Bool?

    @IBAction func settingsBarButtonPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showSettings", sender: self)
    }
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        //  return shows.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return shows.count
        default:
            return shows.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! FilterCell
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "showTestCell", for: indexPath) as! ShowTestCell
            let index = indexPath.row
            let currentShow = shows[index]
            cell.showTitleLabel.text = currentShow.title
            cell.delegate = self
            cell.index = index
            
            //set lottery time labels
            configureLotteryLabels(openLabel: cell.lotteryOpenLabel, closeLabel: cell.lotteryCloseLabel, with: currentShow)
            
            cell.backgroundColor = getAltColor(index: index)
            cell.enterNowButton.layer.cornerRadius = 2
            
            if let lotteryIsOpen = currentShow.lotteryIsOpen(){
                if currentShow.canEnterWeekly == false{
                    if lotteryIsOpen == false {
                        cell.enterNowButton.setTitle("Lottery Closed", for: .normal)
                        cell.enterNowButton.setTitleColor(UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0), for: .normal)
                        cell.enterNowButton.layer.backgroundColor = UIColor(red:0.38, green:0.38, blue:0.38, alpha:1.0).cgColor
                    }else if lotteryIsOpen == true{
                        cell.enterNowButton.setTitle("Enter Now", for: .normal)
                        cell.enterNowButton.layer.backgroundColor = UIColor(red:0.94, green:0.61, blue:0.23, alpha:1.0).cgColor
                        cell.enterNowButton.setTitleColor(UIColor.white, for: .normal)
                    }
                }else{
                    cell.enterNowButton.setTitle("Enter Now", for: .normal)
                    cell.enterNowButton.layer.backgroundColor = UIColor(red:0.94, green:0.61, blue:0.23, alpha:1.0).cgColor
                    cell.enterNowButton.setTitleColor(UIColor.white, for: .normal)
                }
                
            }
            if currentShow.canEnterWeekly{
                cell.entryPeriodLabel.text = "Enter up to a week in advance"
                cell.lotteryCloseLabel.isHidden = true
                cell.lotteryOpenLabel.isHidden = true
                cell.toLabel.isHidden = true
                cell.enterLabel.isHidden = true
            }else{
                cell.entryPeriodLabel.text = "Daily"
                cell.lotteryCloseLabel.isHidden = false
                cell.lotteryOpenLabel.isHidden = false
                cell.toLabel.isHidden = false
                cell.enterLabel.isHidden = false
            }
            
            
            if getFavoriteDefault(currentShow: currentShow) == true{
                cell.favoriteButton.setImage(UIImage(named: "yellow_filled_star")!, for: UIControlState.normal)
                
            }else{
                cell.favoriteButton.setImage(UIImage(named: "yellow_star_outline")!, for: UIControlState.normal)
            }
            
            if getEnteredDefault(currentShow: currentShow) == true{
                let currentDate = Date();
                let userCalendar = Calendar.current
                let dateComponents = userCalendar.dateComponents([.hour, .minute], from: currentDate)
                let lotteryOpenTime = currentShow.lotteryOpen
                let dateComponentsOpen = userCalendar.dateComponents([.hour, .minute], from: lotteryOpenTime)
                if let currentHour = dateComponents.hour, let currentMinute = dateComponents.minute, let lotteryOpenHour = dateComponentsOpen.hour, let lotteryOpenMinute = dateComponentsOpen.minute{
                    if currentHour == lotteryOpenHour && currentMinute == lotteryOpenMinute{
                        //lottery has opened again ("the next day") -- reset has entered
                        cell.hasEnteredButton.setImage(UIImage(named: "yellow_check_outline"), for: UIControlState.normal)
                        setEnteredDefault(currentShow: currentShow, value: false)
                    }
                }
                
                
                cell.hasEnteredButton.setImage(UIImage(named: "yellow_check_filled"), for: UIControlState.normal)
            }else{
                cell.hasEnteredButton.setImage(UIImage(named: "yellow_check_outline"), for: UIControlState.normal)
            }
            
            return cell
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        switch indexPath.section{
        case 0:
            return 100
        case 1:
            //performing filtering 
            let index = indexPath.row
            let currentShow = shows[index]
            
            //weekly filter
            if weeklyFilter == true{
                if currentShow.canEnterWeekly == true{
                    return 165
                }else{
                    return 0
                }
            }
            
            //daily filter 
            if dailyFilter == true{
                if currentShow.canEnterWeekly == false{
                    return 165
                }else{
                    return 0
                }
            }
            
            //open filter
            if openFilter == true{
                if currentShow.lotteryIsOpen() == true{
                    return 165
                }else{
                    return 0
                }
            }
            
            //favorites filter 
            if favoriteFilter == true{
                if getFavoriteDefault(currentShow: currentShow) == true{
                    return 165
                }else{
                    return 0
                }
            }
            return 165
        default:
            fatalError()
        }
    }
    

    
    func getAltColor(index: Int) -> UIColor{
        if index == 0{
           return UIColor(red:0.74, green:0.15, blue:0.15, alpha:1.0)
        }else{
            let even = index%2
            if even == 0{
                return UIColor(red:0.74, green:0.15, blue:0.15, alpha:1.0)
            }else{
                return UIColor(red:0.67, green:0.00, blue:0.00, alpha:1.0)
            }
        }
    }
    
    
    func configureLotteryLabels(openLabel: UILabel, closeLabel: UILabel, with show: Show){

        var openDateComponents = DateComponents()
        openDateComponents.hour = Calendar.current.component(.hour, from: show.lotteryOpen)
        openDateComponents.minute = Calendar.current.component(.minute, from: show.lotteryOpen)
        configureTime(dateComponents: openDateComponents, label: openLabel)

        var closeDateComponents = DateComponents()
        closeDateComponents.hour = Calendar.current.component(.hour, from: show.lotteryCloseEve)
        closeDateComponents.minute = Calendar.current.component(.minute, from: show.lotteryCloseEve)
        configureTime(dateComponents: closeDateComponents, label: closeLabel)
    }
    
    func configureTime(dateComponents: DateComponents, label: UILabel){
        var timeModifier: String = "a.m"
        var printMinutes: String = "0"
        var hour = dateComponents.hour
        var printHour: String = "0"
        
        if hour != nil{
            if hour! >= 12{
                timeModifier = " p.m."
                //convert from 24 hr
                if hour! >= 13{
                    hour = hour! - 12
                }
            }else{
                timeModifier = " a.m."
                if hour! == 0{
                    hour = 12
                }
            }
            printHour = String(hour!)
        }
        
       if let minutes = dateComponents.minute{
            if minutes == 0{
                printMinutes = "00"
            }else if minutes < 10{
                printMinutes = "0" + String(minutes)
            }
            else{
                printMinutes = String(minutes)
            }
        }
        
        let time = printHour + ":" + printMinutes + timeModifier
        label.text = time
    }
    
    
    func getEnteredDefault(currentShow: Show) -> Bool?{
        let defaults = UserDefaults.standard
        
        switch currentShow.title {
        case Constants.ShowTitle.aladdin:
            return defaults.bool(forKey: Constants.UserDefaults.aladdinEntered)
        case Constants.ShowTitle.anastasia:
            return defaults.bool(forKey: Constants.UserDefaults.anastasiaEntered)
        case Constants.ShowTitle.bookOfMormon:
            return defaults.bool(forKey: Constants.UserDefaults.bookOfMormonEntered)
        case Constants.ShowTitle.cats:
            return defaults.bool(forKey: Constants.UserDefaults.catsEntered)
        case Constants.ShowTitle.dearEvanHansen:
            return defaults.bool(forKey: Constants.UserDefaults.dearEvanHansenEntered)
        case Constants.ShowTitle.groundhogDay:
            return defaults.bool(forKey: Constants.UserDefaults.groundhogDayEntered)
        case Constants.ShowTitle.hamilton:
            return defaults.bool(forKey: Constants.UserDefaults.hamiltonEntered)
        case Constants.ShowTitle.kinkyBoots:
            return defaults.bool(forKey: Constants.UserDefaults.kinkyBootsEntered)
        case Constants.ShowTitle.lionKing:
            return defaults.bool(forKey: Constants.UserDefaults.lionKingEntered)
        case Constants.ShowTitle.phantom:
            return defaults.bool(forKey: Constants.UserDefaults.phantomEntered)
        case Constants.ShowTitle.schoolOfRock:
            return defaults.bool(forKey: Constants.UserDefaults.schoolOfRockEntered)
        case Constants.ShowTitle.warPaint:
            return defaults.bool(forKey: Constants.UserDefaults.warPaintEntered)
        case Constants.ShowTitle.wicked:
            return defaults.bool(forKey: Constants.UserDefaults.wickedEntered)
        case Constants.ShowTitle.charlie:
            return defaults.bool(forKey: Constants.UserDefaults.charlieEntered)
        default:
            print("error - show not found")
        }
        
        return nil
    }
    
    func setEnteredDefault(currentShow: Show, value: Bool ){
        let defaults = UserDefaults.standard
        
        switch currentShow.title {
        case Constants.ShowTitle.aladdin:
            defaults.set(value, forKey: Constants.UserDefaults.aladdinEntered)
        case Constants.ShowTitle.anastasia:
            defaults.set(value, forKey: Constants.UserDefaults.anastasiaEntered)
        case Constants.ShowTitle.bookOfMormon:
            defaults.set(value, forKey: Constants.UserDefaults.bookOfMormonEntered)
        case Constants.ShowTitle.cats:
            defaults.set(value, forKey: Constants.UserDefaults.catsEntered)
        case Constants.ShowTitle.dearEvanHansen:
            defaults.set(value,forKey: Constants.UserDefaults.dearEvanHansenEntered)
        case Constants.ShowTitle.groundhogDay:
            defaults.set(value,forKey: Constants.UserDefaults.groundhogDayEntered)
        case Constants.ShowTitle.hamilton:
            defaults.set(value,forKey: Constants.UserDefaults.hamiltonEntered)
        case Constants.ShowTitle.kinkyBoots:
            defaults.set(value,forKey: Constants.UserDefaults.kinkyBootsEntered)
        case Constants.ShowTitle.lionKing:
            defaults.set(value,forKey: Constants.UserDefaults.lionKingEntered)
        case Constants.ShowTitle.phantom:
            defaults.set(value,forKey: Constants.UserDefaults.phantomEntered)
        case Constants.ShowTitle.schoolOfRock:
            defaults.set(value,forKey: Constants.UserDefaults.schoolOfRockEntered)
        case Constants.ShowTitle.warPaint:
            defaults.set(value,forKey: Constants.UserDefaults.warPaintEntered)
        case Constants.ShowTitle.wicked:
            defaults.set(value,forKey: Constants.UserDefaults.wickedEntered)
        case Constants.ShowTitle.charlie:
            defaults.set(value,forKey: Constants.UserDefaults.charlieEntered)
        default:
            print("error - show not found")
        }
        
    }
    
}


extension LotteryHomeTableViewController: ShowCellTestDelegate{
    func didPressEnterButton(_ likeButton: UIButton, on cell: ShowTestCell){
        let currentShow = shows[cell.index]
        let webVC = SwiftWebVC(urlString: currentShow.lotteryURL)
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    func didPressFavoriteButton(_ favoriteButton: UIButton, on cell: ShowTestCell) {
        let currentShow = shows[cell.index]
        if getFavoriteDefault(currentShow: currentShow) == true{
            setFavoriteDefault(currentShow: currentShow, value: false)
            cell.favoriteButton.setImage(UIImage(named: "yellow_star_outline")!, for: UIControlState.normal)
            
        }else{
            setFavoriteDefault(currentShow: currentShow, value: true)
            cell.favoriteButton.setImage(UIImage(named: "yellow_filled_star")!, for: UIControlState.normal)
        }
    }
    
    func getFavoriteDefault(currentShow: Show) -> Bool?{
        let defaults = UserDefaults.standard
        
        switch currentShow.title {
        case Constants.ShowTitle.aladdin:
            return defaults.bool(forKey: Constants.UserDefaults.aladdinFavorite)
        case Constants.ShowTitle.anastasia:
            return defaults.bool(forKey: Constants.UserDefaults.anastasiaFavorite)
        case Constants.ShowTitle.bookOfMormon:
            return defaults.bool(forKey: Constants.UserDefaults.bookOfMormonFavorite)
        case Constants.ShowTitle.cats:
            return defaults.bool(forKey: Constants.UserDefaults.catsFavorite)
        case Constants.ShowTitle.dearEvanHansen:
            return defaults.bool(forKey: Constants.UserDefaults.dearEvanHansenFavorite)
        case Constants.ShowTitle.groundhogDay:
            return defaults.bool(forKey: Constants.UserDefaults.groundhogDayFavorite)
        case Constants.ShowTitle.hamilton:
            return defaults.bool(forKey: Constants.UserDefaults.hamiltonFavorite)
        case Constants.ShowTitle.kinkyBoots:
            return defaults.bool(forKey: Constants.UserDefaults.kinkyBootsFavorite)
        case Constants.ShowTitle.lionKing:
            return defaults.bool(forKey: Constants.UserDefaults.lionKingFavorite)
        case Constants.ShowTitle.phantom:
            return defaults.bool(forKey: Constants.UserDefaults.phantomFavorite)
        case Constants.ShowTitle.schoolOfRock:
            return defaults.bool(forKey: Constants.UserDefaults.schoolOfRockFavorite)
        case Constants.ShowTitle.warPaint:
            return defaults.bool(forKey: Constants.UserDefaults.warPaintFavorite)
        case Constants.ShowTitle.wicked:
            return defaults.bool(forKey: Constants.UserDefaults.wickedFavorite)
        case Constants.ShowTitle.charlie:
            return defaults.bool(forKey: Constants.UserDefaults.charlieFavorite)
        default:
            print("error - show not found")
        }
        
        return nil
    }
    
    func setFavoriteDefault(currentShow: Show, value: Bool ){
        let defaults = UserDefaults.standard
        
        switch currentShow.title {
        case Constants.ShowTitle.aladdin:
             defaults.set(value, forKey: Constants.UserDefaults.aladdinFavorite)
        case Constants.ShowTitle.anastasia:
             defaults.set(value, forKey: Constants.UserDefaults.anastasiaFavorite)
        case Constants.ShowTitle.bookOfMormon:
             defaults.set(value, forKey: Constants.UserDefaults.bookOfMormonFavorite)
        case Constants.ShowTitle.cats:
             defaults.set(value, forKey: Constants.UserDefaults.catsFavorite)
        case Constants.ShowTitle.dearEvanHansen:
             defaults.set(value,forKey: Constants.UserDefaults.dearEvanHansenFavorite)
        case Constants.ShowTitle.groundhogDay:
             defaults.set(value,forKey: Constants.UserDefaults.groundhogDayFavorite)
        case Constants.ShowTitle.hamilton:
             defaults.set(value,forKey: Constants.UserDefaults.hamiltonFavorite)
        case Constants.ShowTitle.kinkyBoots:
             defaults.set(value,forKey: Constants.UserDefaults.kinkyBootsFavorite)
        case Constants.ShowTitle.lionKing:
             defaults.set(value,forKey: Constants.UserDefaults.lionKingFavorite)
        case Constants.ShowTitle.phantom:
             defaults.set(value,forKey: Constants.UserDefaults.phantomFavorite)
        case Constants.ShowTitle.schoolOfRock:
             defaults.set(value,forKey: Constants.UserDefaults.schoolOfRockFavorite)
        case Constants.ShowTitle.warPaint:
             defaults.set(value,forKey: Constants.UserDefaults.warPaintFavorite)
        case Constants.ShowTitle.wicked:
             defaults.set(value,forKey: Constants.UserDefaults.wickedFavorite)
        case Constants.ShowTitle.charlie:
             defaults.set(value,forKey: Constants.UserDefaults.charlieFavorite)
        default:
            print("error - show not found")
        }
        
    }
    


}

extension LotteryHomeTableViewController: FilterCellDelegate{
    
    func didPressEnterDaily(_ button: UIButton, on cell: FilterCell){
        //set all other filters to false
        favoriteFilter = false
        weeklyFilter = false
        openFilter = false
        cell.openLotteriesButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.favoritesButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.enterWeeklyButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)

        
        //set filter
        cell.enterDailyButton.titleLabel?.font = UIFont(name:"Avenir-Black", size: 17.0)
        dailyFilter = true
        tableView.reloadData()

        
    }
        
    func didPressEnterWeekly(_ button: UIButton, on cell: FilterCell){
        //set all other filters to false
        favoriteFilter = false
        dailyFilter = false
        openFilter = false
        cell.enterDailyButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.openLotteriesButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.favoritesButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)

        //set filter
        cell.enterWeeklyButton.titleLabel?.font = UIFont(name:"Avenir-Black", size: 17.0)
        weeklyFilter = true
        tableView.reloadData()

        
    }
        
    func didPressLotteriesOpen(_ button: UIButton, on cell: FilterCell){
        cell.favoritesButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.enterWeeklyButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.enterDailyButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)


        //set all other filters to false
        favoriteFilter = false
        weeklyFilter = false
        dailyFilter = false
        
        //set filter
        cell.openLotteriesButton.titleLabel?.font = UIFont(name:"Avenir-Black", size: 17.0)
        openFilter = true
        tableView.reloadData()
        
    }
        
    func didPressFavorites(_ button: UIButton, on cell: FilterCell){
        //set all other filters to false
        dailyFilter = false
        weeklyFilter = false
        openFilter = false
        cell.enterDailyButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.enterWeeklyButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.openLotteriesButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        
        //set favorite filter to true
        cell.favoritesButton.titleLabel?.font = UIFont(name:"Avenir-Black", size: 17.0)
        favoriteFilter = true
        tableView.reloadData()

        
    }
    
    func didPressNone(_ button: UIButton, on cell: FilterCell){
        dailyFilter = false
        weeklyFilter = false
        openFilter = false
        favoriteFilter = false

        cell.enterDailyButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.enterWeeklyButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.openLotteriesButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        cell.favoritesButton.titleLabel?.font = UIFont(name:"Avenir", size: 17.0)
        
        cell.noneButton.titleLabel?.font = UIFont(name:"Avenir-Black", size: 17.0)

        tableView.reloadData()


    }
    
}




