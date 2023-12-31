import UIKit
import Firebase
class LoginScreen:UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.layer.cornerRadius = 02
        passwordTextField.layer.cornerRadius = 02
        loginTextLabel.text = "Great, let's get started."
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        emailTextField.keyboardType = .emailAddress
        emailTextField.textContentType = .emailAddress

    }
    @IBAction func loginTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
           if error == nil && user != nil {
             
            self.dismiss(animated: false, completion: nil)
            
                          }
            else{
             let alertController = UIAlertController(title: "Error", message: "This account is invalid, please register an account", preferredStyle: .alert)
             let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
              alertController.addAction(defaultAction)
              self.present(alertController, animated: true, completion: nil)
                 }
            
        }
        
       
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToHome", sender: self)
    }
}
