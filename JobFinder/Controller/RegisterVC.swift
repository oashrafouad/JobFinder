//
//  RegisterVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 18/02/2023.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var trackTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var genderSwitch: UISegmentedControl!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordMatchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // These two lines set the color of the selected title to white to be better looking against the blue background
        // Store the white color in a text attribute
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)]
        
        // Set that attrobute to all segmented controls on the screen (which is just one in this case)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        // These functions will execute whenever any of the text fields have their text edited
        fullNameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        companyTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        trackTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    // This will execute whenever there are any touches on the whole screen (essentially always executing and checking for fields)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // First check if password and confirm password are equal, if so, proceed to check the other fields
        if passwordTextField.text != confirmPasswordTextField.text
        {
            passwordMatchLabel.isHidden = false
            registerButton.isEnabled = false
        }
        else
        {
            passwordMatchLabel.isHidden = true
            
            // The check for genderSwitch checks whether Male (0) OR Female (1) is chosen
            if fullNameTextField.hasText && companyTextField.hasText && trackTextField.hasText && emailTextField.hasText && passwordTextField.hasText && confirmPasswordTextField.hasText && (genderSwitch.selectedSegmentIndex == 0 || genderSwitch.selectedSegmentIndex == 1)
            {
                registerButton.isEnabled = true
            }
        }
    }
    
    @IBAction func genderSwitchPressed(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        // The gender input checks the index of the selected segment, then knows the title accordingly (Male: 0, Female: 1)
        userObjc.addUser(fullName: fullNameTextField.text!, gender: genderSwitch.titleForSegment(at: genderSwitch.selectedSegmentIndex)!, company: companyTextField.text!, track: trackTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
     
        userObjc.assignCurrentUser(email: emailTextField.text!, password: passwordTextField.text!)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (textField.hasText)
        {
            // Reset to default text field appearance
            textField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        }
        else
        {
            textField.layer.borderColor = UIColor.systemRed.cgColor
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
        }
    }
}
