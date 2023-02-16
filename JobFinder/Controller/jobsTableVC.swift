//
//  TableViewController.swift
//  JobFinder
//
//  Created by Tadros Nasr on 16/02/2023.
//

import UIKit

class jobsTableVC: UITableViewController {

    var males : [String] = ["Mohamed" , "Ahmed" , "Ali" , "Malek"]
    var females : [String] = ["Heba" , "Asmaa" , "Shimaa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return males.count
        case 1:
            return females.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Males"
        case 1:
            return "Females"
        default:
            return ""
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Males"
        case 1:
            return "Females"
        default:
            return ""
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            print(males[indexPath.row])
            
        case 1:
            print(females[indexPath.row])
        default:
            print("")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        print("Button is pressed")
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        
        
//     print("Secion #\(indexPath.section), row #\(indexPath.row)")
        
        switch indexPath.section {
        case 0://we make the cell text label = the value of row index in the array
            cell.textLabel?.text = males[indexPath.row]
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
