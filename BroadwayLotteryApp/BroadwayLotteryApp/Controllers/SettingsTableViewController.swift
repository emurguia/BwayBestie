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
    @IBOutlet weak var autofillSwitch: UISwitch!
    let notificationsSwitch = UISwitch()
    var notificationsEnabled: Bool?
  //  var notificationsEnabled: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //checkNotificationStatus()
        autofillSwitch.isOn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.autofillOn)
    }

//func checkNotificationStatus(){
//    let center = UNUserNotificationCenter.current()
//    center.getNotificationSettings(completionHandler: { (settings) in
//        if settings.authorizationStatus == .denied {
//            //print("notifcations denied")
//            self.isEnabledLabel.text = "Disabled"
//        }
//        
//        if settings.authorizationStatus == .authorized {
//            //print("notifications authorized")
//            self.isEnabledLabel.text = "Enabled"
//        }
//    })
//    
//}
//    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //unwind segue from edit user info view
    @IBAction func unwindToSettingsViewController(_ segue: UIStoryboardSegue) {
        
    }

    @IBAction func autofillSwitchValueDidChange(_ sender: UISwitch) {
        let defaults = UserDefaults.standard
        defaults.set(sender.isOn, forKey: Constants.UserDefaults.autofillOn)
    }
    
    
    
    // MARK: - Table view data source
    
    //    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let view = UIView()
    //        view.backgroundColor = UIColor.red
    //        return view
    //    }
}

