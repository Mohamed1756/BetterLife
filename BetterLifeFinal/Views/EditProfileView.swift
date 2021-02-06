//
//  EditProfileView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 06/02/2021.
//

import UIKit

class EditProfileView:UIViewController {
    
    @IBOutlet weak var heightTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
           if let name = defaults.string(forKey: "heightValue"){
           heightTextfield.text = name
        }
        
    }
   
 

    @IBAction func saveButton(_ sender: Any) {
        if (heightTextfield.text?.count)! > 0 {
            let defaults = UserDefaults.standard
            defaults.set(heightTextfield.text!, forKey: "heightValue")
           }
    }
    
}
