//
//  EditUserInfoTableViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/27/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class EditUserInfoTableViewController: UITableViewController {

    
    //MARK -- Properties
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var birthDateField: UITextField!
    @IBOutlet weak var birthYearField: UITextField!
    @IBOutlet weak var numberTickets: UISegmentedControl!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var birthMonthField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailAddressField.delegate = self
        zipCodeField.delegate = self
        birthMonthField.delegate = self
        birthDateField.delegate = self
        birthYearField.delegate = self
        
        configureCells()

    }
    
    func configureCells(){
        
        //get previously entered user data 
        let firstNameCurrent: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.firstName)
        let lastNameCurrent: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.lastName)
        let zipCodeCurrent: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.zipCode)
        let emailCurrent: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.email)
        let numberTicketsCurrent: Int? = KeychainWrapper.standard.integer(forKey: Constants.Keychain.numberTickets)
        let birthMonthCurrent: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.birthMonth)
        let birthDateCurrent: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.birthDate)
        let birthYearCurrent: String? = KeychainWrapper.standard.string(forKey: Constants.Keychain.birthYear)
        
        
        //set fields to previously entered data
        firstNameField.text = firstNameCurrent
        lastNameField.text = lastNameCurrent
        zipCodeField.text = zipCodeCurrent
        emailAddressField.text = emailCurrent
        birthMonthField.text = birthMonthCurrent
        birthDateField.text = birthDateCurrent
        birthYearField.text = birthYearCurrent
        if numberTicketsCurrent == 1{
            numberTickets.selectedSegmentIndex = 0
        }else{
            numberTickets.selectedSegmentIndex = 1
        }
        
        //button appereance 
        saveButton.layer.cornerRadius = 4
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        //get values entered by user
        guard let firstName = firstNameField.text, let lastName = lastNameField.text, let email = emailAddressField.text, let zipCode = zipCodeField.text, let birthMonth = birthMonthField.text, let birthDate = birthDateField.text, let birthYear = birthYearField.text else{
            return
        }
        //get number tickets
        
        
        let numberTicketsIndex = numberTickets.selectedSegmentIndex
        var tickets = 1
        if numberTicketsIndex == 1{
            tickets = 2
        }
        
        //get age
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = Int (birthYear)
        dateComponents.month = Int (birthMonth)
        dateComponents.day = Int (birthDate)
        let calendar = Calendar.current
        guard let birthday = calendar.date(from: dateComponents) else {
            print("User details not saved -- date creation failed")
            return
        }
        let ageComponenets = calendar.dateComponents([.year], from: birthday, to: currentDate)
        let userAge = ageComponenets.year!
        
        
        //save new values to keychain
        let saveFirst: Bool = KeychainWrapper.standard.set(firstName, forKey: Constants.Keychain.firstName)
        let saveLast: Bool = KeychainWrapper.standard.set(lastName, forKey: Constants.Keychain.lastName)
        let saveEmail: Bool = KeychainWrapper.standard.set(email, forKey: Constants.Keychain.email)
        let saveZip: Bool = KeychainWrapper.standard.set(zipCode, forKey: Constants.Keychain.zipCode)
        let saveMonth: Bool = KeychainWrapper.standard.set(birthMonth, forKey: Constants.Keychain.birthMonth)
        let saveDate: Bool = KeychainWrapper.standard.set(birthDate, forKey: Constants.Keychain.birthDate)
        let saveYear: Bool = KeychainWrapper.standard.set(birthYear, forKey: Constants.Keychain.birthYear)
        let saveTickets: Bool = KeychainWrapper.standard.set(tickets, forKey: Constants.Keychain.numberTickets)
        let saveAge: Bool = KeychainWrapper.standard.set(userAge, forKey: Constants.Keychain.userAge)
        
        if saveFirst == false || saveLast  == false || saveZip == false || saveMonth == false || saveDate == false || saveYear == false || saveTickets == false || saveAge == false || saveEmail == false{
            print("User details not saved -- keychain save failed")
            return
        }
        
        //return user to settings screen 
        sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.70,
                       initialSpringVelocity: 4.50,
                       options: .allowUserInteraction,
                       animations: {  [] in
                            sender.transform = .identity
            },
                       completion: nil)
        
        UIView.transition(with: sender, duration: 0.5, options: .transitionCrossDissolve, animations: {
            sender.setTitle("Saved", for: .normal)
        }, completion: nil)
    }


}

extension EditUserInfoTableViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //look for next responder
        if let nextField = textField.superview?.superview?.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField{
            nextField.becomeFirstResponder()
        }else {
            //no next responder -- remove keyboard
            textField.resignFirstResponder()
        }
        
        return false
    }
    
}

