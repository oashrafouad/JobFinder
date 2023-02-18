//
//  ProfileVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        
        // Return back to login/register screen first time, then return to welcome screen second time
        self.navigationController?.popViewController(animated: true)


        //self.navigationController?.popViewController(animated: true)



    }
}
