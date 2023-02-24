//
//  ProfileVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    
    // Fill the view labels with the currently logged in user's data
    override func viewWillAppear(_ animated: Bool) {
        fullNameLabel.text = currentUser?.fullName
        emailLabel.text = currentUser?.email
        trackLabel.text = currentUser?.track
        
        trackLabel.sizeToFit()
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        
        // Return to welcome screen
        self.navigationController?.popToRootViewController(animated: true)
    }
}
