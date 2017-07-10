//
//  GetStartedViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/10/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    //properties
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "CollectUserInfo", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
        
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
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
