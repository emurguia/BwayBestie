//
//  NotificationTableViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/26/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationTableViewController: UITableViewController {

    //MARK: Properties
    let shows = ShowService.getShows()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       checkNotificationStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check if user has enabled notifications for app
    func checkNotificationStatus(){
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings(completionHandler: { (settings) in
            if settings.authorizationStatus == .denied {
                self.notificationsDisabledAlert()
            }
        })
    }
    
    //display alert if notifications are disabled
    func notificationsDisabledAlert(){
        let alertController = UIAlertController(title: "Notifications Disabled", message: "Go to Settings -> Notifications -> BroadwayLotteryApp to enable notifications", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default) { (action) in
            //go back to settings page 
//            self.navigationController?.popViewController(animated: true)
            
            self.sideMenuController?.performSegue(withIdentifier: "lotteryHomeSegue", sender: nil)

        }
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Get Notified When Lotteries Open Each Day"
        case 1:
            return "Manage Notifications By Show"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return shows.count
        default:
            print("Error: unexpected indexPath")
            return 0
        }
        
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "allShowsNotificationCell", for: indexPath) as! AllShowsNotificationCell
                cell.settingLabel.text = "All Shows"
                cell.settingSwitch.isOn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.notificationsOn)
                cell.delegate = self
                cell.index = indexPath.row
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "allShowsNotificationCell", for: indexPath) as! AllShowsNotificationCell
                cell.settingLabel.text = "Additional Alerts When Lotteries Close"
                cell.settingSwitch.isOn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.closeNotificationsOn)
                cell.delegate = self
                cell.index = indexPath.row
                return cell
            default:
                fatalError("Error: unexpected indexPath")
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "showNotificationCell", for: indexPath) as! ShowNotificationCell
            let index = indexPath.row
            let currentShow = shows[index]
            //let defaults = UserDefaults.standard
            
            cell.index = index
            cell.showTitleLabel.text = currentShow.title
            if let notificationStatus = getNotificationDefault(currentShow: currentShow){
                cell.notificationSwitch.isOn = notificationStatus
            }
            
            cell.delegate = self
            
            return cell
        default:
            fatalError("Error: unexpected indexPath")
        }
    }


    func getNotificationDefault(currentShow: Show) -> Bool?{
        let defaults = UserDefaults.standard
        
        switch currentShow.title {
        case Constants.ShowTitle.aladdin:
            return defaults.bool(forKey: Constants.UserDefaults.aladdinNotifications)
        case Constants.ShowTitle.anastasia:
            return defaults.bool(forKey: Constants.UserDefaults.anastasiaNotifications)
        case Constants.ShowTitle.bookOfMormon:
            return defaults.bool(forKey: Constants.UserDefaults.bookOfMormonNotifications)
        case Constants.ShowTitle.cats:
            return defaults.bool(forKey: Constants.UserDefaults.catsNotifications)
        case Constants.ShowTitle.dearEvanHansen:
            return defaults.bool(forKey: Constants.UserDefaults.dearEvanHansenNotifications)
        case Constants.ShowTitle.greatComet:
            return defaults.bool(forKey: Constants.UserDefaults.greatCometNotifications)
        case Constants.ShowTitle.groundhogDay:
            return defaults.bool(forKey: Constants.UserDefaults.groundhogDayNotifications)
        case Constants.ShowTitle.hamilton:
            return defaults.bool(forKey: Constants.UserDefaults.hamiltonNotifications)
        case Constants.ShowTitle.kinkyBoots:
            return defaults.bool(forKey: Constants.UserDefaults.kinkyBootsNotifications)
        case Constants.ShowTitle.lionKing:
            return defaults.bool(forKey: Constants.UserDefaults.lionKingNotifications)
        case Constants.ShowTitle.onYourFeet:
            return defaults.bool(forKey: Constants.UserDefaults.onYourFeetNotifications)
        case Constants.ShowTitle.oslo:
            return defaults.bool(forKey: Constants.UserDefaults.osloNotifications)
        case Constants.ShowTitle.phantom:
            return defaults.bool(forKey: Constants.UserDefaults.phantomNotifications)
        case Constants.ShowTitle.schoolOfRock:
            return defaults.bool(forKey: Constants.UserDefaults.schoolOfRockNotifications)
        case Constants.ShowTitle.warPaint:
            return defaults.bool(forKey: Constants.UserDefaults.warPaintNotifications)
        case Constants.ShowTitle.wicked:
            return defaults.bool(forKey: Constants.UserDefaults.wickedNotifications)
        default:
            print("error - show not found")
        }
        
        return nil
    }

}

extension NotificationTableViewController: ShowNotificationCellDelegate{
    
    //function called when UISwitch value changes
    func notificationSwitchValueChanged(_ switchToggle: UISwitch, on cell: ShowNotificationCell){
        let currentShow = shows[cell.index]
        
        if switchToggle.isOn{
            NotificationService.setOpenShowNotification(currentShow: currentShow)
            if UserDefaults.standard.bool(forKey: Constants.UserDefaults.closeNotificationsOn) == true {
                NotificationService.setCloseShowNotification(currentShow: currentShow)
            }
        }else{
            NotificationService.removeShowNotification(currentShow: currentShow)
            NotificationService.removeShowCloseNotification(currentShow: currentShow)
        }
    }
}

extension NotificationTableViewController: AllShowsNotificationCellDelegate{
    
    func settingSwitchValueDidChange(_ switchToggle: UISwitch, on cell: AllShowsNotificationCell, index: Int){
        if index == 0{
            if switchToggle.isOn{
                NotificationService.setAllNotifications()
            }else{
                NotificationService.removeAllNotifications()
            }
            tableView.reloadData()
        }
        
        if index == 1{
            if switchToggle.isOn{
                NotificationService.setCloseForActiveNotifications()
            }else{
                NotificationService.removeCloseForActiveNotifications()
            }
        }
    }
}
