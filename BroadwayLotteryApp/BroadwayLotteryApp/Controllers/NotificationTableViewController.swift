//
//  NotificationTableViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/26/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class NotificationTableViewController: UITableViewController {

    //MARK: Properties
    let shows = ShowService.getShows()
    
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
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "allShowsNotificationCell", for: indexPath) as! AllShowsNotificationCell
            cell.settingLabel.text = "All Shows"
            cell.settingSwitch.isOn = UserDefaults.standard.bool(forKey: Constants.UserDefaults.notificationsOn)
            cell.delegate = self
            return cell
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NotificationTableViewController: ShowNotificationCellDelegate{
    
    //function called when UISwitch value changes
    func notificationSwitchValueChanged(_ switchToggle: UISwitch, on cell: ShowNotificationCell){
        let currentShow = shows[cell.index]
        //let defaults = UserDefaults.standard
        
        if switchToggle.isOn{
            //defaults.set(true, forKey: Constants.UserDefaults.notificationsOn)
            
            NotificationService.setOpenShowNotification(currentShow: currentShow)
            //NotificationService.setCloseShowNotification(currentShow: currentShow)
        }else{
            //this is issue -- not setting SHOW user default, setting general default
            NotificationService.removeShowNotification(currentShow: currentShow)
        }
    }
}

extension NotificationTableViewController: AllShowsNotificationCellDelegate{
    
    func settingSwitchValueDidChange(_ switchToggle: UISwitch, on cell: AllShowsNotificationCell){
        if switchToggle.isOn{
            print("turning on all notifs")
            NotificationService.setAllNotifications()
        }else{
            print("turning OFF all notifs")
            NotificationService.removeAllNotifications()
        }
        print("notif on user default:")
        print(UserDefaults.standard.bool(forKey: Constants.UserDefaults.notificationsOn))
        tableView.reloadData()
    }
}
