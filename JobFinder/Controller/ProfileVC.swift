//
//  ProfileVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var trackView: UIView!
    
    override func viewDidLoad() {
        // Modify the cornerRadius at runtime as it's not possible from storyboard
        trackView.layer.cornerRadius = 10
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        
        // Return back to login/register screen first time, then return to welcome screen second time
//        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true)

        //self.navigationController?.popViewController(animated: true)



    }
}
