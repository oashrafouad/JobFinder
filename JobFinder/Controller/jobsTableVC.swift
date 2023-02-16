//
//  TableViewController.swift
//  JobFinder
//
//  Created by Tadros Nasr on 16/02/2023.
//

import UIKit

class jobsTableVC: UITableViewController {
    // Initialize an object of the struct to be able to call functions on it
    var jobObjc = JobBrain()
    var males : [String] = ["Mohamed" , "Ahmed" , "Ali" , "Malek"]
    var females : [String] = ["Heba" , "Asmaa" , "Shimaa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example code for job struct
        
        // Intialize jobbrain object
        var jobBrain = JobBrain()
        
        // Get job object and store in a variable (at index 0 as this function is used for the first time)
        var job = jobBrain.getJob()
        
        // Access the title of Job object
        var title = job.title
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
        
        return 200
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Jobs"// we need to add (the targeted track of user as a returned value from struct) shuch as:
        //ios developer jobs ...etc
        }
    
    //function to make changes when select a cell from the table
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//        print(jobObjc.jobsList[indexPath.row])
//
//    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        print("Button is pressed")
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        
        
//     print("Secion #\(indexPath.section), row #\(indexPath.row)")
        
        switch indexPath.section {
        case 0://we make the cell text label = the value of row index in the array
            cell.textLabel?.text = jobObjc.getJobTitle()
        case 1:
            cell.textLabel?.text = females[indexPath.row]
        default:
            print("")
        }
        
        cell.detailTextLabel?.text = "ITI"
        cell.imageView?.image = UIImage(named: "flower")
        
        cell.accessoryType = .detailDisclosureButton

        return cell
    }

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            switch indexPath.section {
            case 0:
                males.remove(at: indexPath.row)
            case 1:
                females.remove(at: indexPath.row)
            default:
                print("")
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 

    @IBAction func addButtonAction(_ sender: Any) {
        
        males.append("New Friend")
        self.tableView.reloadData()
        
    }
}
