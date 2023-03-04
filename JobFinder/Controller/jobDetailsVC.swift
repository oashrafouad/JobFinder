import UIKit

class jobDetailsVC: UIViewController {

    @IBOutlet weak var navBarTitle: UINavigationItem!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        descriptionLabel.sizeToFit()
    }
}
