//
//  SettingsTableViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/19/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    //MARK -- properties 
    let shows = ShowService.getShows()
    let settings: [String] = ["Autofill", "Notifications"]
    let notificationsSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setSwitches(tableView, indexPath: ind)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return settings.count
        case 2:
             return shows.count
        default:
            fatalError("Error: unexpected indexPath")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "editInfoCell", for: indexPath) as! EditInfoCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingCell
            let index = indexPath.row
            let currentSetting = settings[index]
            cell.settingLabel.text = currentSetting
            cell.tableView = tableView
            
            //display show notification cells
            if settings[index] == "Notifications" {
                cell.delegate = self
                let defaults = UserDefaults.standard
                cell.settingSwitch.isOn = defaults.bool(forKey: Constants.UserDefaults.notificationsOn)
//                if defaults.bool(forKey: Constants.UserDefaults.notificationsOn) == true{
//                    cell.settingSwitch.isOn = true
//                }else{
//                    cell.settingSwitch.isOn = false
//                }
                notificationsSwitch.isOn = cell.settingSwitch.isOn
                //print(notificationsSwitch.isOn)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "showNotificationCell", for: indexPath) as! ShowNotificationCell
                //print("notif on")
            let index = indexPath.row
            let currentShow = shows[index]
            cell.index = index
            cell.showTitleLabel.text = currentShow.title
            cell.delegate = self
            return cell
        default:
            fatalError("Error: unexpected indexPath")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        switch indexPath.section{
        case 0:
            return 60
        case 1:
            return 60
        case 2:
            if notificationsSwitch.isOn{
                return 60
            }
            return 0
        default:
            fatalError("Error: unexpected indexPath")
        }
    }
    
    func setSwitches(_ tableView: UITableView, indexPath: IndexPath){
        //let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingCell
        
    }
}


extension SettingsTableViewController: SettingCellDelegate{
    
    func settingSwitchValueChanged(_ switchToggle: UISwitch, on cell: SettingCell){
        notificationsSwitch.isOn = !notificationsSwitch.isOn
        let defaults = UserDefaults.standard
        //cell.settingSwitch
//        if notificationsSwitch.isOn{
//            print("show notifs turned on")
//            NotificationService.setAllNotifications()
//            defaults.set(true, forKey: Constants.UserDefaults.notificationsOn)
//        }else{
//            print("show notifs turned off")
//            NotificationService.removeAllNotifications()
//            defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)
//        }
        
        if cell.settingSwitch.isOn{
            print("show notifs turned on")
            NotificationService.setAllNotifications()
            defaults.set(true, forKey: Constants.UserDefaults.notificationsOn)
        }else{
            print("show notifs turned off")
            NotificationService.removeAllNotifications()
            defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)
        }
        //reload data when done
        tableView.reloadData()
    
    }
    
}


extension SettingsTableViewController: ShowNotificationCellDelegate{
    func notificationSwitchValueChanged(_ switchToggle: UISwitch, on cell: ShowNotificationCell){
        let currentShow = shows[cell.index]
        let defaults = UserDefaults.standard
        if switchToggle.isOn{
           
            defaults.set(true, forKey: Constants.UserDefaults.isLoggedIn)

            //turn on notifications
            NotificationService.setOpenShowNotification(currentShow: currentShow)
            NotificationService.setCloseShowNotification(currentShow: currentShow)
        }else{
            //turn off notifications
            NotificationService.removeShowNotification(currentShow: currentShow)
        }
    }
    
}
