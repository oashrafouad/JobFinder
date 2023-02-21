//
//  TableViewController.swift
//  JobFinder
//
//  Created by Tadros Nasr on 16/02/2023.
//

import UIKit

class jobsTableVC: UITableViewController {
    // Initialize an object of the struct to be able to call functions on it
    
    var detailVC : jobDetailsVC!
    var jobs : [Job]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailVC = storyboard?.instantiateViewController(identifier: "jobDetailsVC") as? jobDetailsVC
        
        jobs = jobObjc.getJobsInCurrentUserTrack()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of row = nu,ber of job's array elements
        
        return jobs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 230
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "All Jobs"// we need to add (the targeted track of user as a returned value from struct) shuch as: ios developer jobs ...etc
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? JobTableViewCell
        
        cell!.titleLabel?.text = jobs[indexPath.row].title
        cell!.descriptionLabel?.text = jobs[indexPath.row].description
        cell!.technologyLabel?.text = jobs[indexPath.row].track
        
        return cell!
    }
    
    //function to make changes when select a cell from the table
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate each cell to its info in jobDetailsVC
        
        self.navigationController?.present(detailVC, animated: true)
        
        var job = jobObjc.getJobAtIndex(index: indexPath.row)
        
        detailVC.navBarTitle.title = job.title
        detailVC.titleLabel.text = job.title + " |"
        detailVC.companyLabel.text = job.company
        detailVC.trackLabel.text = job.track
        detailVC.descriptionLabel.text = job.description
    }
    
    @IBAction func applyButton(_ sender: UIButton) {
        print("Pressed!")
    }
}
