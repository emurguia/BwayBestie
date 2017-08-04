//
//  ShowTestCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/28/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

protocol ShowCellTestDelegate: class{
    func didPressEnterButton(_ likeButton: UIButton, on cell: ShowTestCell)
}

class ShowTestCell: UITableViewCell{
    
    @IBOutlet weak var showTitleLabel: UILabel!
    @IBOutlet weak var lotteryOpenLabel: UILabel!
    @IBOutlet weak var lotteryCloseLabel: UILabel!
    @IBOutlet weak var enterNowButton: UIButton!
    @IBOutlet weak var entryPeriodLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    weak var delegate: ShowCellTestDelegate?
    var index: Int = -1
    
    @IBAction func enterNowButtonPressed(_ sender: UIButton) {
        delegate?.didPressEnterButton(sender, on: self)
    }
}
