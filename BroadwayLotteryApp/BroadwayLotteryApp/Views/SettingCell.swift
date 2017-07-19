//
//  SettingCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/19/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit
protocol SettingCellDelegate: class{
    func settingSwitchValueChanged(_ switchToggle: UISwitch, on cell: SettingCell)
}
class SettingCell: UITableViewCell {

    //MARK -- properties
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    weak var tableView: UITableView?
    weak var delegate: SettingCellDelegate?
    
    @IBAction func settingSwitchValueDidChange(_ sender: UISwitch) {
        //really only want it for notifs...make sure it's fine for autofill
        delegate?.settingSwitchValueChanged(settingSwitch, on: self)
        //tableView?.reloadData()
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
