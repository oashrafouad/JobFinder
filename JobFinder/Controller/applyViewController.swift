import UIKit

class applyViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var navBarTitle: UINavigationItem!
    @IBOutlet weak var coverTextView: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var successfulLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        coverTextView.layer.borderWidth = 1.0
        coverTextView.layer.cornerRadius = 5
        
        coverTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBarTitle.title = "Apply"
        
    }
    
     @IBAction func confirmButton(_ sender: UIButton) {
         
         successfulLabel.isHidden = false
     }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if coverTextView.hasText
        {
            confirmButton.isEnabled = true
        }
        else
        {
            confirmButton.isEnabled = false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if (textView.hasText)
        {
            // Reset to default text view appearance
            textView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        }
        else
        {
            textView.layer.borderColor = UIColor.systemRed.cgColor
            textView.layer.borderWidth = 1
        }
    }
    
}
