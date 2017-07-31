//
//  AllShowsNotificationCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/31/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

protocol AllShowsNotificationCellDelegate: class{
    func settingSwitchValueDidChange(_ switchToggle: UISwitch, on cell: AllShowsNotificationCell)
}

class AllShowsNotificationCell: UITableViewCell{
    
    //MARK: Properties
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    weak var delegate: AllShowsNotificationCellDelegate?
    
    @IBAction func settingSwitchDidChange(_ sender: UISwitch) {
        delegate?.settingSwitchValueDidChange(sender, on: self)
    }
}
