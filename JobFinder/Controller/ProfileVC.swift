//
//  ProfileVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var trackView: UIView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    
    override func viewDidLoad() {
        // Modify the cornerRadius at runtime as it's not possible from storyboard
        trackView.layer.cornerRadius = 10
    }
    
    // Fill the view labels with the currently logged in user's data
    override func viewWillAppear(_ animated: Bool) {
        fullNameLabel.text = currentUser?.fullName
        emailLabel.text = currentUser?.email
        trackLabel.text = currentUser?.track
        
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        
        // Return to welcome screen
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}
