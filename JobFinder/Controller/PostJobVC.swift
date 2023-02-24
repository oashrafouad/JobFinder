//
//  PostJobVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class PostJobVC: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var postJobButton: UIButton!
    @IBOutlet var tapGes: UITapGestureRecognizer!
    @IBOutlet weak var trackPicker: UIPickerView!
    @IBOutlet weak var jobPostedLabel: UILabel!
    
    @objc func dismissKeyboard() {
        // Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        descriptionTextView.delegate = self
        
        // Set the delegate and data source for trackPicker to the delegate and data source of this view controller
        trackPicker.delegate = self
        trackPicker.dataSource = self
        
        // Make description text view look the same as the other text fields on this screen
        descriptionTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.cornerRadius = 5
        
        // These functions will execute whenever any of the text fields or text views have their text edited
        jobTitleTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        companyTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
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
        
        if jobTitleTextField.hasText && descriptionTextView.hasText && companyTextField.hasText
        {
            postJobButton.isEnabled = true
        }
        else
        {
            postJobButton.isEnabled = false
        }
    }
    
    @IBAction func postJobButtonPressed(_ sender: UIButton) {

        let title = jobTitleTextField.text!
        let description = descriptionTextView.text!
        let company = companyTextField.text!

        // Checks the index of the selected row in the component which has index 0 (e.g. the only component), then gets the track at this index in tracksList array. The values in trackPicker are presented in the same order as the trackList array, so they have the same indexes
        let track = jobObjc.tracksList[trackPicker.selectedRow(inComponent: 0)]
        
        jobObjc.addJob(title: title, description: description, track: track, company: company)
        
        jobsOfCurrentUser = jobObjc.getJobsInCurrentUserTrack()
        
        jobPostedLabel.isHidden = false
        
    }
    
    // For the text fields
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
    
    // For the description text view
    func textViewDidChange(_ textView: UITextView) {
        if (textView.hasText)
        {
            // Reset to default text view appearance
            textView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        }
        else
        {
            textView.layer.borderColor = UIColor.systemRed.cgColor
            textView.layer.borderWidth = 1
        }
    }
}
