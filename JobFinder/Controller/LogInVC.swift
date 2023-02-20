//
//  LogInVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class LogInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logInCheckLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // These functions will execute whenever any of the text fields have their text edited
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        
        var email = emailTextField.text!
        var password = passwordTextField.text!
        // Check if a user exists with the entered credentials
        // We need to find a way to block the segue from happening if no user is found
        if(userObjc.isUserFound(email: email, password: password))
        {
            logInCheckLabel.isHidden = true
            userObjc.assignCurrentUser(email: email, password: password)
            
        }
        else
        {
            logInCheckLabel.isHidden = false
        }
    }
    
    // This will execute whenever there are any touches on the whole screen (essentially always executing and checking for fields)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if emailTextField.hasText && passwordTextField.hasText
        {
            logInButton.isEnabled = true
        }
        else
        {
            logInButton.isEnabled = false
        }
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
