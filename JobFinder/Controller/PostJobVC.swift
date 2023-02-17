//
//  PostJobVC.swift
//  JobFinder
//
//  Created by Omar Ashraf on 17/02/2023.
//

import UIKit

class PostJobVC: UIViewController {
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make description text view look the same as the other text fields on this screen
        
        descriptionTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        
        descriptionTextView.layer.borderWidth = 1.0
        
        descriptionTextView.layer.cornerRadius = 5
        
    }
}
