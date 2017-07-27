//
//  SettingsTableViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/19/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit
import UserNotifications

class SettingsTableViewController: UITableViewController {

    //MARK -- properties 
    let shows = ShowService.getShows()
    @IBOutlet weak var isEnabledLabel: UILabel!
    
    let notificationsSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if user has authorized notifications
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings(completionHandler: { (settings) in
            if settings.authorizationStatus == .denied {
                print("notifcations denied")
                self.isEnabledLabel.text = "Disabled"
            }
            
            if settings.authorizationStatus == .authorized {
                print("notifications authorized")
                self.isEnabledLabel.text = "Enabled"
            }
        })
        
        self.tableView.sectionHeaderHeight = 70
      
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "displayNotifications"{
            if isEnabledLabel.text == "Disabled"{
                //set up and present alert
                let alertController = UIAlertController(title: "Notifications Disabled", message: "Go to Settings -> Notifications -> BroadwayLotteryApp to enable notifications", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                alertController.addAction(OKAction)
                present(alertController, animated: true)
                
                return false
            }
           // print("transitions to notification screen")
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.red
//        return view
//    }

    @IBAction func unwindToSettingsViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }

}

