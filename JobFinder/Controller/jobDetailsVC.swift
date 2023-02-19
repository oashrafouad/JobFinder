//
//  jobDetailsVC.swift
//  JobFinder
//
//  Created by Tadros Nasr on 17/02/2023.
//

import UIKit

class jobDetailsVC: UIViewController {

  
    @IBOutlet weak var navBarTitle: UINavigationItem!
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        var job1 = jobObjc.getJob()
        navBarTitle.title = job1.title
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
