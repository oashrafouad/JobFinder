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
    @IBOutlet weak var descripeLabel: UILabel!
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        var job1 = jobObjc.getJob()
        navBarTitle.title = job1.title
        titleLabel.text = job1.title + " |"
        companyLabel.text = job1.company
        trackLabel.text = job1.track
        descripeLabel.text = job1.description
    }
    

   

    @IBAction func applyButton(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true)
    }
}
