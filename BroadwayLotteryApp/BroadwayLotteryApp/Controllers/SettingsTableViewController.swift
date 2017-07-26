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
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let identifer = segue.identifier{
            if identifer == "displayNotifications"{
                print("transitions to notification screen ")
            }
        }
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
    
    //override func prep
        
        //    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if let identifer = segue.identifier{
//            if identifer == "displayNote"{
//                print("Transitioning to the Display Note View Controller")
//                let indexPath = tableView.indexPathForSelectedRow!
//                let note = notes[indexPath.row]
//                let displayNoteViewController = segue.destination as! DisplayNoteViewController
//                displayNoteViewController.note = note
//            }else if identifer == "addNote"{
//                print("+ button tapped")
//            }
//        }
//    }


    
    //if user tries to tap on notifications cell and isEnabledLabel.text = "Disabled" -- trigger pop up that tells them to edit permissions in Phone Settings
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            if isEnabledLabel.text == "Disabled"{
                //trigger UIAlertController
                print("alert--go to your phone settings to enable notifications")
            }
            
        }
    }


}


//extension SettingsTableViewController: SettingCellDelegate{
//    
//    //function called when UISwitch value changes
//    func settingSwitchValueChanged(_ switchToggle: UISwitch, on cell: SettingCell){
//        //notificationsSwitch.isOn = !notificationsSwitch.isOn
//        //let defaults = UserDefaults.standard
//        if cell.settingSwitch.isOn{
//            print("show notifs turned on")
//            NotificationService.setAllNotifications()
//           // defaults.set(true, forKey: Constants.UserDefaults.notificationsOn)
//        }else{
//            print("show notifs turned off")
//            NotificationService.removeAllNotifications()
//            //defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)
//        }
//        //reload data when done
//        tableView.reloadData()
//    }
//
//}
//
//
//
//extension SettingsTableViewController: EditInfoCellDelegate{
//    
//    func editInfoButtonWasTapped(_ button: UIButton, on cell: EditInfoCell) {
//        //display Edit Info screen
//        
//        let storyboard = UIStoryboard(name: "CollectUserInfo", bundle: nil)
//        let initialViewController = storyboard.instantiateInitialViewController()
//        
//        self.view.window?.rootViewController = initialViewController
//        self.view.window?.makeKeyAndVisible()
//    }
//}
