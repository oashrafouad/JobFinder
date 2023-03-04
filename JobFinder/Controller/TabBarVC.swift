import UIKit

class TabBarVC: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
}
