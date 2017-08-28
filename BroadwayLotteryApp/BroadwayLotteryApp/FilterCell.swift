//
//  FilterCell.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 8/27/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit

protocol FilterCellDelegate: class{
    func didPressEnterDaily(_ button: UIButton, on cell: FilterCell)
    
    func didPressEnterWeekly(_ button: UIButton, on cell: FilterCell)
    
    func didPressLotteriesOpen(_ button: UIButton, on cell: FilterCell)
    
    func didPressFavorites(_ button: UIButton, on cell: FilterCell)
    
    func didPressNone(_ button: UIButton, on cell: FilterCell)
}

class FilterCell: UITableViewCell{
    
    //MARK: Properties
    
    @IBOutlet weak var enterDailyButton: UIButton!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    @IBOutlet weak var openLotteriesButton: UIButton!
    
    @IBOutlet weak var enterWeeklyButton: UIButton!
    @IBOutlet weak var noneButton: UIButton!
    weak var delegate: FilterCellDelegate?
    

    @IBAction func enterDailyButtonPressed(_ sender: UIButton) {
        delegate?.didPressEnterDaily(sender, on: self)
    }

    @IBAction func enterWeeklyButtonPressed(_ sender: UIButton) {
        delegate?.didPressEnterWeekly(sender, on: self)
    }

    @IBAction func openLotteriesButtonPressed(_ sender: UIButton) {
        delegate?.didPressLotteriesOpen(sender, on: self)
    }
   
    @IBAction func favoritesButtonPressed(_ sender: UIButton) {
        delegate?.didPressFavorites(sender, on: self)
    }
    @IBAction func noneButtonPressed(_ sender: UIButton) {
        delegate?.didPressNone(sender, on: self)
    }
}
