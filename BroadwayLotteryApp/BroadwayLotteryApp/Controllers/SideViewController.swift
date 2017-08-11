//
//  MenuViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 8/3/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit
import SideMenuController

class SideViewController: UITableViewController{
    
    let segues = ["lotteryHomeSegue", "notificationsSegue", "editInformationSegue"]

    private var previousIndex: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = previousIndex {
            tableView.deselectRow(at: index as IndexPath, animated: true)
        }
        

        if !(indexPath.row == 0){
            sideMenuController?.performSegue(withIdentifier: segues[indexPath.row - 1], sender: nil)
            previousIndex = indexPath as NSIndexPath?
            
        }
    }

    
}
