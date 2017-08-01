//
//  LotteryHomeTableViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/11/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class LotteryHomeTableViewController: UITableViewController {

    @IBOutlet weak var backgroundView: UIView!
    //MARK -- Properties 
    let shows = ShowService.getShows()

    @IBAction func settingsBarButtonPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showSettings", sender: self)
    }
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showTestCell", for: indexPath) as! ShowTestCell
       // let cell: ShowCell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as! ShowCell
        let index = indexPath.row
        let currentShow = shows[index]
        print(currentShow.title)
        cell.showTitleLabel.text = currentShow.title
        cell.delegate = self
        cell.index = index
        if let lotteryIsOpen = currentShow.lotteryIsOpen(){
            if lotteryIsOpen == false{
                print("setting label to lottery closed")
                cell.enterNowButton.setTitle("Lottery Closed", for: .normal)
            }else if lotteryIsOpen == true{
                cell.enterNowButton.setTitle("Enter Now", for: .normal)
            }
        }
        //test cell
        cell.enterNowButton.layer.cornerRadius = 4
        //cell.showImage.image = UIImage(contentsOfFile: "Aladdin_digitallottery_980x1502")
        
        //set lottery time labels
        configureLotteryLabels(openLabel: cell.lotteryOpenLabel, closeLabel: cell.lotteryCloseLabel, with: currentShow)
        
        return cell
    }
    
    func configureLotteryLabels(openLabel: UILabel, closeLabel: UILabel, with show: Show){

        var openDateComponents = DateComponents()
        openDateComponents.hour = Calendar.current.component(.hour, from: show.lotteryOpen)
        openDateComponents.minute = Calendar.current.component(.minute, from: show.lotteryOpen)
        
        var closeDateComponents = DateComponents()
        closeDateComponents.hour = Calendar.current.component(.hour, from: show.lotteryCloseEve)
        closeDateComponents.minute = Calendar.current.component(.minute, from: show.lotteryCloseEve)
        
        //check if need to convert local time
        let easternTimeZone = TimeZone(identifier: "America/New_York")
        if TimeZone.autoupdatingCurrent != easternTimeZone{
           //lottery open
            let conversionResultOpen = NotificationService.convertToLocalTime(dateComponents: openDateComponents, timeZone: TimeZone.autoupdatingCurrent)
            if let dateComponents = conversionResultOpen.0 {
                configureTime(dateComponents: dateComponents, label: openLabel, crossedMidnight: conversionResultOpen.1)
            }
            
            //loterry close
            let conversionResultClose = NotificationService.convertToLocalTime(dateComponents: closeDateComponents, timeZone: TimeZone.autoupdatingCurrent)
            if let dateComponents = conversionResultClose.0 {
                configureTime(dateComponents: dateComponents, label: closeLabel, crossedMidnight: conversionResultClose.1)
            }
        }else{
            configureTime(dateComponents: openDateComponents, label: openLabel, crossedMidnight: false)
            configureTime(dateComponents: closeDateComponents, label: closeLabel, crossedMidnight: false)
        }
    }
    
    func configureTime(dateComponents: DateComponents, label: UILabel, crossedMidnight: Bool){
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
//                if crossedMidnight == true{
//                    timeModifier = " a.m."
//                }
            }else{
                timeModifier = " a.m."
                if hour! == 0{
                    hour = 12
                }
//                if crossedMidnight == true{
//                    timeModifier = " p.m."
//                }
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("performing segue")
        if segue.identifier == "showSettings" {
            let destVC = segue.destination as! SettingsTableViewController
            destVC.navigationItem.title = "Settings"
        }
    }
 

}

extension LotteryHomeTableViewController: ShowCellDelegate{
    
    func didTapEnterButton(_ likeButton: UIButton, on cell: ShowCell){
        let currentShow = shows[cell.index]
        let webVC = SwiftWebVC(urlString: currentShow.lotteryURL)
        self.navigationController?.pushViewController(webVC, animated: true)
    }
   
}

extension LotteryHomeTableViewController: ShowCellTestDelegate{
    func didPressEnterButton(_ likeButton: UIButton, on cell: ShowTestCell){
        let currentShow = shows[cell.index]
        let webVC = SwiftWebVC(urlString: currentShow.lotteryURL)
        self.navigationController?.pushViewController(webVC, animated: true)
    }

}


