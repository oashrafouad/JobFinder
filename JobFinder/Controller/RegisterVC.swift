//
//  RegisterVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 18/02/2023.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var genderSwitch: UISegmentedControl!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordMatchLabel: UILabel!
    @IBOutlet weak var trackPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and data source for trackPicker to the delegate and data source of this view controller
        trackPicker.delegate = self
        trackPicker.dataSource = self
        
        // These two lines set the color of the selected title to white to be better looking against the blue background
        // Store the white color in a text attribute
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)]
        
        // Set that attrobute to all segmented controls on the screen (which is just one in this case)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        // These functions will execute whenever any of the text fields have their text edited
        fullNameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        companyTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // These 3 functions are for trackPicker
    // Think of the UIPickerView as a table with rows and columns. This sets the number of vertical columns, in our case we only need one column containing all the tracks
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // This sets the number of rows (e.g. tracks) to be displayed
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jobObjc.tracksList.count
    }
    
    // This sets the title for each row. "row" represents the row index (starting from 0) so we get the value of the string at this index in tracksList array and return it
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jobObjc.tracksList[row]
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
            if fullNameTextField.hasText && companyTextField.hasText && emailTextField.hasText && passwordTextField.hasText && confirmPasswordTextField.hasText && (genderSwitch.selectedSegmentIndex == 0 || genderSwitch.selectedSegmentIndex == 1)
            {
                registerButton.isEnabled = true
            }
        }
    }
    
    @IBAction func genderSwitchPressed(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        var fullName = fullNameTextField.text!
        var email = emailTextField.text!
        var password = passwordTextField.text!
        var company = companyTextField.text!
        
        // Checks the index of the selected segment, then gets the title of the selected segment accordingly (Male: 0, Female: 1)
        var gender = genderSwitch.titleForSegment(at: genderSwitch.selectedSegmentIndex)!
        
        // Checks the index of the selected row in the component which has index 0 (e.g. the only component), then gets the track at this index in tracksList array. The values in trackPicker are presented in the same order as the trackList array, so they have the same indexes
        var track = jobObjc.tracksList[trackPicker.selectedRow(inComponent: 0)]
        
        userObjc.addUser(fullName: fullName, gender: gender, company: company, track: track, email: email, password: password)
        
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
