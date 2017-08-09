//
//  WelcomePageThreeViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 8/9/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class WelcomePageThreeViewController: UIViewController{
    
    @IBOutlet weak var welcomeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeImage.image = UIImage.gif(name: "email_short")
    }
}
