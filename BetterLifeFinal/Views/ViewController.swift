//
//  ViewController.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 30/12/2020.
//

import UIKit

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
}

