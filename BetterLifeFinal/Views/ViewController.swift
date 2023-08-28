import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func registerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
    @IBAction func loginButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toLoginScreen", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "toTheHomeScreen", sender: self)
    }
    }
}

