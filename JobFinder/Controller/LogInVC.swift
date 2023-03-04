import UIKit

class LogInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logInCheckLabel: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To dismiss keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // These functions will execute whenever any of the text fields have their text edited
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func dismissKeyboard() {
        
        // Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        let Tab = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // Check if a user exists with the entered credentials
        if(userObjc.isUserFound(email: email, password: password))
        {
            userObjc.assignCurrentUser(email: email, password: password)
            self.navigationController?.pushViewController(Tab!, animated: true)
        }
        else
        {
            logInCheckLabel.isHidden = false
        }
        
    }
    
    // This will execute whenever there are any touches on the whole screen (essentially always executing and checking for fields)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if emailTextField.hasText && passwordTextField.hasText
        {
            logInButton.isEnabled = true
        }
        else
        {
            logInButton.isEnabled = false
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if (textField.hasText)
        {
            // Reset to default text field appearance
            textField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        }
        else
        {
            textField.layer.borderColor = UIColor.systemRed.cgColor
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
        }
    }
}
