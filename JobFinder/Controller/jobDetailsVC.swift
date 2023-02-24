//
//  jobDetailsVC.swift
//  JobFinder
//
//  Created by Tadros Nasr on 17/02/2023.
//

import UIKit

class jobDetailsVC: UIViewController {

    @IBOutlet weak var navBarTitle: UINavigationItem!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewWillAppear(_ animated: Bool) {
        descriptionLabel.sizeToFit()
    }
    
    @IBAction func applyButton(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true)
    }
}
