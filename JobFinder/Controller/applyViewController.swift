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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coverTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        coverTextView.layer.borderWidth = 1.0
        coverTextView.layer.cornerRadius = 5
        navTitle.title = "Test"
        
        let vc = storyboard?.instantiateViewController(identifier: "jobDetailsVC") as! jobDetailsVC
        navTitle.title = vc.title
    }
     @IBAction func confirmButton(_ sender: UIButton) {
         
     }


}
