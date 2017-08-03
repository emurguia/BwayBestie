//
//  CustomSideMenuController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 8/3/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit
import SideMenuController

class CustomSideMenuController: SideMenuController{
    
    //initialize controller bar with preferences
    required init?(coder aDecoder: NSCoder) {
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "hamburger_menu")
        SideMenuController.preferences.drawing.sidePanelPosition = .overCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 300
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .showUnderlay
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //inital center segue
        performSegue(withIdentifier: "lotteryHomeSegue", sender: nil)
        //side menu
        performSegue(withIdentifier: "sideMenuSegue", sender: nil)
        //embed(centerViewController: UINavigationController(rootViewController: LotteryNavigationViewController()), cacheIdentifier: "LotteryHomeViewController")
        //embed(centerViewController: UINavigationController(rootViewController:FCViewController()), cacheIdentifier: FCViewController.cacheIdentifier)
    }
}
