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
    let shows = ShowService.getShows()

    @IBAction func settingsBarButtonPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showSettings", sender: self)
    }
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let cell: ShowCell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as! ShowCell
        let index = indexPath.row
        let currentShow = shows[index]
        
        cell.showTitleLabel.text = currentShow.title
        cell.delegate = self
        cell.index = index
        
        //set lottery time labels
        configureLotteryLabels(openLabel: cell.lotteryOpenLabel, closeLabel: cell.lotteryCloseLabel, with: currentShow)
        
        return cell
    }
    
    func configureLotteryLabels(openLabel: UILabel, closeLabel: UILabel, with show: Show){
        
        /*
        * lottery open
        */
        
        
      //  NotificationService.convertToLocalTime(dateComponents: <#T##DateComponents#>, timeZone: <#T##TimeZone#>)
      //  let lotteryOpen = show.lotteryOpen
        var openDateComponents = DateComponents()
        openDateComponents.hour = Calendar.current.component(.hour, from: show.lotteryOpen)
        openDateComponents.minute = Calendar.current.component(.minute, from: show.lotteryOpen)
        
        var closeDateComponents = DateComponents()
        closeDateComponents.hour = Calendar.current.component(.hour, from: show.lotteryCloseEve)
        closeDateComponents.minute = Calendar.current.component(.minute, from: show.lotteryCloseEve)
        
        //convert to local time
        let easternTimeZone = TimeZone(identifier: "America/New_York")
        if TimeZone.autoupdatingCurrent != easternTimeZone{
            if let dateComponents =  NotificationService.convertToLocalTime(dateComponents: openDateComponents, timeZone: TimeZone.autoupdatingCurrent){
                configureTime(dateComponents: dateComponents, label: openLabel)
            }
            
            if let dateComponents = NotificationService.convertToLocalTime(dateComponents: closeDateComponents, timeZone: TimeZone.autoupdatingCurrent){
                configureTime(dateComponents: dateComponents, label: closeLabel)
            }
        }else{
            configureTime(dateComponents: openDateComponents, label: openLabel)
            configureTime(dateComponents: closeDateComponents, label: closeLabel)
        }
        
//        var timeModifierOpen: String = "a.m"
//        var printMinutesOpen: String = "0"
//        var hourOpen = Calendar.current.component(.hour, from: lotteryOpen)
//        let minutesOpen = Calendar.current.component(.minute, from: lotteryOpen)
//        
//        if hourOpen >= 12{
//            timeModifierOpen = " p.m."
//            //convert from 24 hr
//            if hourOpen >= 13{
//                hourOpen = hourOpen - 12
//            }
//        }else{
//            timeModifierOpen = " a.m."
//            if hourOpen == 0{
//                hourOpen = 12
//            }
//        }
//        
//        if minutesOpen == 0{
//            printMinutesOpen = "00"
//        }else{
//            printMinutesOpen = String(minutesOpen)
//        }
//        
//        
//        let openTime = String(hourOpen) + ":" + printMinutesOpen + timeModifierOpen
//        openLabel.text = openTime

        /*
         * lottery close evening
         */
//        let lotteryCloseEve = show.lotteryCloseEve
//        var timeModiferClose: String = " a.m."
//        var printMinutesCloseEve = "0"
//        var hourCloseEve = Calendar.current.component(.hour, from: lotteryCloseEve)
//        let minutesCloseEve = Calendar.current.component(.minute, from: lotteryCloseEve)
//        
//        if hourCloseEve >= 12{
//            timeModiferClose = " p.m."
//            //convert from 24 hr
//            if hourCloseEve >= 13{
//                hourCloseEve = hourCloseEve - 12
//            }
//        }else{
//            timeModiferClose = " a.m."
//            if hourCloseEve == 0{
//                hourCloseEve = 12
//            }
//        }
//        
//        if minutesCloseEve == 0{
//            printMinutesCloseEve = "00"
//        }else{
//            printMinutesCloseEve = String(minutesCloseEve)
//        }
//    
//        
//        let closeTime = String(hourCloseEve) + ":" + printMinutesCloseEve + timeModiferClose
//        closeLabel.text = closeTime

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
            }else{
                printMinutes = String(minutes)
            }
        }
        
        let time = printHour + ":" + printMinutes + timeModifier
        label.text = time
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
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


