//
//  applyViewController.swift
//  JobFinder
//
//  Created by Tadros Nasr on 20/02/2023.
//

import UIKit

class applyViewController: UIViewController {

    @IBOutlet weak var navTitle: UINavigationItem!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var coverTextView: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var sucessfulLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sucessfulLabel.isHidden = true
        coverTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        coverTextView.layer.borderWidth = 1.0
        coverTextView.layer.cornerRadius = 5
        
        confirmButton.isEnabled = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navTitle.title = "Apply"

    }
    
     @IBAction func confirmButton(_ sender: UIButton) {
         sucessfulLabel.isHidden = false
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "JobsTableVC") as! JobsTableVC
         self.navigationController?.popToViewController(vc, animated: true)
         
     }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if coverTextView.hasText
        {
            confirmButton.isEnabled = true
        }
        else
        {
            confirmButton.isEnabled = false
        }
    }

}
