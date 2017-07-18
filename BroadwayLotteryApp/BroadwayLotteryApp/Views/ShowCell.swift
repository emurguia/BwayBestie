//
//  ShowCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/17/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

protocol ShowCellDelegate: class{
    func didTapEnterButton(_ likeButton: UIButton, on cell: ShowCell)
}
class ShowCell: UITableViewCell{
    
    //Mark -- properties
    @IBOutlet weak var showTitleLabel: UILabel!
    @IBOutlet weak var lotteryOpenLabel: UILabel!
    @IBOutlet weak var lotteryCloseLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    
    weak var delegate: ShowCellDelegate?
    
    var index: Int = -1
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
         delegate?.didTapEnterButton(sender, on: self)
    }
}
