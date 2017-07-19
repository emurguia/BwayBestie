//
//  ShowNotificationCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/19/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

class ShowNotificationCell: UITableViewCell {
    //MARK -- properties
    @IBOutlet weak var showTitleLabel: UILabel!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    @IBAction func notificationSwitchValueDidChange(_ sender: UISwitch) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
