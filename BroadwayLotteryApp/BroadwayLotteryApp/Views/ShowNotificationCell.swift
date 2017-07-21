//
//  ShowNotificationCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/19/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

protocol ShowNotificationCellDelegate: class{
    func notificationSwitchValueChanged(_ switchToggle: UISwitch, on cell: ShowNotificationCell)
}

class ShowNotificationCell: UITableViewCell {
    
    //MARK -- properties
   
    @IBOutlet weak var showTitleLabel: UILabel!
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    weak var delegate: ShowNotificationCellDelegate?

    var index: Int = -1
    
    @IBAction func notificationSwitchValueDidChange(_ sender: UISwitch) {
        delegate?.notificationSwitchValueChanged(notificationSwitch, on: self)
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
