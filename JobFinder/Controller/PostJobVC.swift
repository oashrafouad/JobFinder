//
//  PostJobVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class PostJobVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var trackTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var postJobButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make description text view look the same as the other text fields on this screen
        descriptionTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.cornerRadius = 5
        
        // These functions execute whenever any of the text fields or text views have their text edited
        jobTitleTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        trackTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        companyTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        descriptionTextView.delegate = self
        
    }
    
    // This will execute whenever there are any touches on the whole screen (essentially always executing and checking for fields)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if jobTitleTextField.hasText && descriptionTextView.hasText && trackTextField.hasText && companyTextField.hasText
        {
            postJobButton.isEnabled = true
        }
        else
        {
            postJobButton.isEnabled = false
        }
    }
    
    @IBAction func postJobButtonPressed(_ sender: UIButton) {

        jobObjc.addJob(title: jobTitleTextField.text!, description: descriptionTextView.text, track: trackTextField.text!, company: companyTextField.text!)
        
    }
    
    // For the text fields
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (textField.hasText)
        {
            textField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        }
        else
        {
            textField.layer.borderColor = UIColor.systemRed.cgColor
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
        }
    }

    // For the description text view
    func textViewDidChange(_ textView: UITextView) {
        if (textView.hasText)
        {
            textView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        }
        else
        {
            textView.layer.borderColor = UIColor.systemRed.cgColor
            textView.layer.borderWidth = 1
        }
    }
}
