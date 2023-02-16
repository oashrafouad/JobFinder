//
//  jobsTableVC.swift
//  JobFinder
//
//  Created by Tadros Nasr on 16/02/2023.
//

import UIKit

class jobsTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
                // Do any additional setup after loading the view.
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        //number of jobs
        return 5
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "tadros"
        print("done!")
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "job name"
    }

}
