import UIKit

class JobsTableVC: UITableViewController {
    
    var detailVC : jobDetailsVC!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailVC = storyboard?.instantiateViewController(identifier: "jobDetailsVC") as? jobDetailsVC
        
        jobsOfCurrentUser = jobObjc.getJobsInCurrentUserTrack()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Refresh the table view each time this view appears to reflect a posted job
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of row = nu,ber of job's array elements
        
        return jobsOfCurrentUser.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 170
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return currentUser!.track + " Jobs"
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? JobTableViewCell
        
        cell!.titleLabel?.text = jobsOfCurrentUser[indexPath.row].title
        cell!.descriptionLabel?.text = jobsOfCurrentUser[indexPath.row].description
        cell!.trackLabel?.text = jobsOfCurrentUser[indexPath.row].track
        
        return cell!
    }
    
    // Function to make changes when select a cell from the table
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Navigate each cell to its info in jobDetailsVC
        self.navigationController?.present(detailVC, animated: true)
        
        detailVC.navBarTitle.title = jobsOfCurrentUser[indexPath.row].title
        detailVC.titleLabel.text = jobsOfCurrentUser[indexPath.row].title + " |"
        detailVC.companyLabel.text = jobsOfCurrentUser[indexPath.row].company
        detailVC.trackLabel.text = jobsOfCurrentUser[indexPath.row].track
        detailVC.descriptionLabel.text = jobsOfCurrentUser[indexPath.row].description
    }
}
