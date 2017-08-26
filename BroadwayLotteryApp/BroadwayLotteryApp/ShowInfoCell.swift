//
//  ShowInfoCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 8/25/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit


protocol ShowInfoCellDelegate: class{
    
    func didPressFavoriteButton(_ favoriteButton: UIButton, on cell: ShowInfoCell)
}
class ShowInfoCell: UITableViewCell{
    
    @IBOutlet weak var favoriteButton: UIButton!
    weak var delegate: ShowInfoCellDelegate?

    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        delegate?.didPressFavoriteButton(sender, on: self)
    }
}
