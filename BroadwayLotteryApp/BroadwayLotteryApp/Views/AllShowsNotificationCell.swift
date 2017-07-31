//
//  AllShowsNotificationCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/31/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

protocol AllShowsNotificationCellDelegate: class{
    func settingSwitchValueDidChange(_ switchToggle: UISwitch, on cell: AllShowsNotificationCell, index: Int)
}

class AllShowsNotificationCell: UITableViewCell{
    
    //MARK: Properties
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    var index: Int = -1
    
    weak var delegate: AllShowsNotificationCellDelegate?
    
    @IBAction func settingSwitchDidChange(_ sender: UISwitch) {
        delegate?.settingSwitchValueDidChange(sender, on: self, index: index)
    }
}
