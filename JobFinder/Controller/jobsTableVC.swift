//
//  TableViewController.swift
//  JobFinder
//
//  Created by Tadros Nasr on 16/02/2023.
//

import UIKit

class JobsTableVC: UITableViewController {
    // Initialize an object of the struct to be able to call functions on it

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example code for job struct
        
       
        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of row = nu,ber of job's array elements
        
        return jobObjc.jobsList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 230
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "All Jobs"// we need to add (the targeted track of user as a returned value from struct) shuch as: ios developer jobs ...etc
        }
    
    //function to make changes when select a cell from the table
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(jobObjc.jobsList[indexPath.row])

    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! JobTableViewCell
//     print("Secion #\(indexPath.section), row #\(indexPath.row)")
        //we make the cell text label = the value of row index in the array
//            cell.textLabel?.text = jobObjc.getJobTitle()
        // Get job object and store in a variable (at index 0 as this function is used for the first time)
        
        var job = jobObjc.getJob()
        
        //jobCell.titleLabel?.text = jobTitle
        
        cell.titleLabel?.text = job.title
        cell.descriptionLabel?.text = job.description
        cell.technologyLabel?.text = job.track
        
//        cell.detailTextLabel?.text = "ITI"
//        cell.imageView?.image = UIImage(named: "flower")
//

        return cell
    }

   
    @IBOutlet weak var titleLabel: UILabel!
    // Override to support editing the table view.
    @IBOutlet weak var descriptionLabel: UILabel!
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//                //jobObjc.jobsList.remove(at: indexPath.row)
//
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    @IBAction func applyButton(_ sender: UIButton) {
        print("Pressed!")
    }
    

   
}
