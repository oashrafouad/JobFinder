//
//  ViewController.swift
//  JobFinder
//
//  Created by Omar Ashraf on 10/02/2023.
//

import UIKit

class ViewController: UIViewController {

    
    // Job object test initialize
    var job = Job(title: "iOS", description: "This is an iOS job", technology: "Swift", link: URL(string: "https://apple.com/")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func applyButton(_ sender: UIButton) {
        // When pressing on the apply button, open the link in the job struct in a new browser window
        UIApplication.shared.open(job.link)
        
    }
    
}
