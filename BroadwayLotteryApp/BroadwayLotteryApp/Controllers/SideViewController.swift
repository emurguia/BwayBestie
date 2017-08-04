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
    
    let segues = ["lotteryHomeSegue", "settingsHomeSegue", "questionsSegue"]
    //let dataSource = [FCViewController.self, SCViewController.self, TCViewController.self] as [Any]

    //let dataSource = [LotteryNavigationViewController.self, SettingsNavigationViewController.self, QuestionsNavigationViewController.self]

    private var previousIndex: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //    let cacheIdentifier = "LotteryHomeViewController"
    //    let cacheIdentifier = "NotificationHomeViewController"
    //    let cacheIdentifier = "QuestionsViewController"
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = previousIndex {
            tableView.deselectRow(at: index as IndexPath, animated: true)
        }
        
//        let controllerType = dataSource[indexPath.row]
//        
//        //get cache id
//        var cacheIdentifier = String()
//        if controllerType == LotteryNavigationViewController.self{
//            cacheIdentifier = "LotteryHomeViewController"
//        } else if controllerType == SettingsNavigationViewController.self{
//            cacheIdentifier = "NotificationHomeViewController"
//        }else if controllerType == QuestionsNavigationViewController.self{
//            cacheIdentifier = "QuestionsViewController"
//        }
//        
//        if let controller = sideMenuController?.viewController(forCacheIdentifier: cacheIdentifier) {
//            //view controller has been cached -- transition to it
//            sideMenuController?.embed(centerViewController: controller)
//        } else {
//            //view controller has not been cached -- init it
//            sideMenuController?.embed(centerViewController: controllerType.init(), cacheIdentifier: cacheIdentifier)
//        }

        if !(indexPath.row == 0){
            sideMenuController?.performSegue(withIdentifier: segues[indexPath.row - 1], sender: nil)
            previousIndex = indexPath as NSIndexPath?
            
        }
    }

    
}
