//
//  WelcomePageViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 8/8/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class WelcomePageViewController: UIViewController{
    
    @IBOutlet weak var welcomeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeImage.image = UIImage.gif(name: "enter_lottery_short_compressed")
    }
}
