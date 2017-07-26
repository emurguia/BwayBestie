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
        let cell = tableView.dequeueReusableCell(withIdentifier: "showNotificationCell", for: indexPath) as! ShowNotificationCell
        let index = indexPath.row
        let currentShow = shows[index]
        let defaults = UserDefaults.standard
        
        cell.index = index
        cell.showTitleLabel.text = currentShow.title
        cell.notificationSwitch.isOn = defaults.bool(forKey: Constants.UserDefaults.notificationsOn)
        cell.delegate = self
        
        return cell
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
        let defaults = UserDefaults.standard
        
        if switchToggle.isOn{
            defaults.set(true, forKey: Constants.UserDefaults.notificationsOn)
            NotificationService.setOpenShowNotification(currentShow: currentShow)
            NotificationService.setCloseShowNotification(currentShow: currentShow)
        }else{
            defaults.set(false, forKey: Constants.UserDefaults.notificationsOn)
            NotificationService.removeShowNotification(currentShow: currentShow)
        }
    }
    
}
