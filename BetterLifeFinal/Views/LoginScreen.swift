//
//  LoginScreen.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 30/12/2020.
//

import UIKit
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
    }
    @IBAction func backButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToHome", sender: self)
    }
}
