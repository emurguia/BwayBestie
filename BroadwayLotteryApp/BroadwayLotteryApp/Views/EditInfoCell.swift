//
//  EditInfoCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/19/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

protocol EditInfoCellDelegate: class{
    func editInfoButtonWasTapped(_ button: UIButton, on cell: EditInfoCell)
}


class EditInfoCell: UITableViewCell {

    //MARK -- properties
    @IBOutlet weak var editInfoLabel: UILabel!
    @IBOutlet weak var tapToEditButton: UIButton!
    weak var delegate: EditInfoCellDelegate?
    
    @IBAction func editInfoButtonTapped(_ sender: UIButton) {
        delegate?.editInfoButtonWasTapped(sender, on: self)
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
