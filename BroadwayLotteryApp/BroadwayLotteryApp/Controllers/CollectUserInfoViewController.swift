//
//  CollectUserInfoViewController.swift
//  BroadwayLotteryApp
//
//  Created by Eleanor Murguia on 7/10/17.
//  Copyright © 2017 Eleanor Murguia. All rights reserved.
//
import UIKit
import SwiftKeychainWrapper

class CollectUserInfoViewController: UITableViewController {

    //MARK: Properties
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var birthMonthField: UITextField!
    @IBOutlet weak var birthDateField: UITextField!
    @IBOutlet weak var birthYearField: UITextField!
    @IBOutlet weak var numberTicketsSegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates for text fields
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailAddressField.delegate = self
        zipCodeField.delegate = self
        birthMonthField.delegate = self
        birthYearField.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        
        //get values from textfields 
        //does NOT currently fail if not all fields filled out -- change this?
        guard let firstName = firstNameField.text, let lastName = lastNameField.text, let email = emailAddressField.text, let zipCode = zipCodeField.text, let birthMonth = birthMonthField.text, let birthDate = birthDateField.text, let birthYear = birthYearField.text else{
            //print("User details not saved -- all fields not filled out")
            return
        }
        //get number tickets
        let numberTicketsIndex = numberTicketsSegment.selectedSegmentIndex
        var numberTickets = 1
        if numberTicketsIndex == 1{
            numberTickets = 2
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

        
        //save user details to keychain 
        let saveFirst: Bool = KeychainWrapper.standard.set(firstName, forKey: Constants.Keychain.firstName)
        let saveLast: Bool = KeychainWrapper.standard.set(lastName, forKey: Constants.Keychain.lastName)
        let saveEmail: Bool = KeychainWrapper.standard.set(email, forKey: Constants.Keychain.email)
        let saveZip: Bool = KeychainWrapper.standard.set(zipCode, forKey: Constants.Keychain.zipCode)
        let saveMonth: Bool = KeychainWrapper.standard.set(birthMonth, forKey: Constants.Keychain.birthMonth)
        let saveDate: Bool = KeychainWrapper.standard.set(birthDate, forKey: Constants.Keychain.birthDate)
        let saveYear: Bool = KeychainWrapper.standard.set(birthYear, forKey: Constants.Keychain.birthYear)
        let saveTickets: Bool = KeychainWrapper.standard.set(numberTickets, forKey: Constants.Keychain.numberTickets)
        let saveAge: Bool = KeychainWrapper.standard.set(userAge, forKey: Constants.Keychain.userAge)

        if saveFirst == false || saveLast  == false || saveZip == false || saveMonth == false || saveDate == false || saveYear == false || saveTickets == false || saveAge == false || saveEmail == false{
            print("User details not saved -- keychain save failed")
            return
        }
        
        //set UserDefaults to logged in 
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: Constants.UserDefaults.isLoggedIn)
        
        //present Home storyboard 
        let storyboard = UIStoryboard(name: "LotteryHome", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()

    }

}

extension CollectUserInfoViewController: UITextFieldDelegate{
    
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

