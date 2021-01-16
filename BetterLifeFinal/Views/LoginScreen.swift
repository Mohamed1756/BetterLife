//
//  LoginScreen.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 30/12/2020.
//

import UIKit
import FirebaseAuth
class LoginScreen: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.layer.cornerRadius = 02
        passwordTextField.layer.cornerRadius = 02
       

    }
    @IBAction func loginTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
           if error == nil{
             self.performSegue(withIdentifier: "loginToHome", sender: self)
                          }
            else{
             let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
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
