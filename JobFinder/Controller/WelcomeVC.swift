//
//  WelcomeVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        
        // Hide the navigation bar as this view should always appear as the root view to the user
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = false
    }
}
