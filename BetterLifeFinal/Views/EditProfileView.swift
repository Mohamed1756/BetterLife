//
//  EditProfileView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 06/02/2021.
//

import UIKit

class EditProfileView:UIViewController {
    
    @IBOutlet weak var heightTextfield: UITextField!
    
    
    @IBOutlet weak var weightGoalTextField: UITextField!
    
    
    @IBOutlet weak var currentWeightTextField: UITextField!
    
    @IBOutlet weak var targetWeightTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
           if let name = defaults.string(forKey: "weightGoalValue"){
            weightGoalTextField.text = name
        }
        if let currentWeight = defaults.string(forKey: "currentWeightValue"){
            currentWeightTextField.text = currentWeight
     }
        if let targetWeight = defaults.string(forKey: "targetWeightValue"){
            targetWeightTextField.text = targetWeight
     }
        
        
    }
   
 

    @IBAction func saveButton(_ sender: Any) {
        if (weightGoalTextField.text?.count)! > 0 {
            let defaults = UserDefaults.standard
            defaults.set(weightGoalTextField.text!, forKey: "weightGoalValue")
        }
        if (currentWeightTextField.text?.count)! > 0 {
            let defaults = UserDefaults.standard
            defaults.set(currentWeightTextField.text!, forKey: "currentWeightValue")
        }
        if (targetWeightTextField.text?.count)! > 0 {
            let defaults = UserDefaults.standard
            defaults.set(targetWeightTextField.text!, forKey: "targetWeightValue")
        }
        
    }
    
}
