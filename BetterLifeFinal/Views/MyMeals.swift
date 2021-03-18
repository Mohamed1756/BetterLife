//
//  MyMeals.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 03/01/2021.
//

import UIKit

class MyMeals:UIViewController {
    
    
    @IBOutlet weak var noDietryRequirementsButton: UIButton!
    
    @IBOutlet weak var toVegetarianButton: UIButton!
    
    @IBOutlet weak var toVeganButton: UIButton!
    
    @IBOutlet weak var toPescatarianButton: UIButton!
    
    @IBOutlet weak var toGlutenFreeButton: UIButton!
    
    @IBOutlet weak var requirementsTextLabel: UILabel!
    
    @IBOutlet weak var firstLineTitle: UILabel!
    
    override func viewDidLoad() {
        
        nameOfButtons()
        titleTextLabel()
    }
    
    // Button Textfields
    
    func nameOfButtons() {
        noDietryRequirementsButton.setTitle("None", for: .normal)
        
        toVegetarianButton.setTitle("Vegetarian", for: .normal)
        
        toVeganButton.setTitle("Vegan", for: .normal)
        
        toPescatarianButton.setTitle("Pescatarian", for: .normal)
        
        toGlutenFreeButton.setTitle("Gluten Free", for: .normal)
        
    }
    
    // Title Text Label
    
    func titleTextLabel() {
        firstLineTitle.text = "Any Dietry"
        requirementsTextLabel.text = "Requirements"
    }

    // Button Actions Segues
    
    
    @IBAction func noneButtonTapped(_ sender: UIButton) {
        
        let noneStoryboard = UIStoryboard (name: "NoneToFoodIntolerance", bundle: Bundle.main)
        
        guard let toFoodIntoleranceScreen = noneStoryboard.instantiateViewController(withIdentifier: "FoodIntoleranceScreen") as? FoodIntoleranceScreen else {
            
            return
        }
        
        navigationController?.pushViewController(toFoodIntoleranceScreen, animated: true)
    }
    
    
    
    @IBAction func vegetarianButtonTapped(_ sender: UIButton) {
        
        let vegetarianStoryboard = UIStoryboard (name: "VegeterianToFoodIntolerance", bundle: Bundle.main)
        
        guard let toVegetarianScreen = vegetarianStoryboard.instantiateViewController(withIdentifier: "VegeterianToFoodIntolerance") as? VegetarainFoodIntoleranceScreen else {
            return
        }
        navigationController?.pushViewController(toVegetarianScreen, animated: true)
        
    }
    
    
    @IBAction func veganButtonTapped(_ sender: UIButton) {
        
        let veganStoryboard = UIStoryboard (name: "VeganToFoodIntolerance", bundle: Bundle.main)
        
        
        guard let toVeganScreen = veganStoryboard.instantiateViewController(withIdentifier: "VeganToFoodIntolerance") as? VeganFoodIntolerance else {
            
            return
        }
        
        navigationController?.pushViewController(toVeganScreen, animated: true)
    }
    
    
    @IBAction func pescatarianButtonTapped(_ sender: UIButton) {
        
        let pescatarianStoryboard = UIStoryboard (name: "PescToFoodIntolerance", bundle: Bundle.main)
        
        guard let toPescatarianScreen = pescatarianStoryboard.instantiateViewController(withIdentifier: "PescToFoodIntolerance") as? PescFoodIntolerance else {
            
            return
        }
        
        navigationController?.pushViewController(toPescatarianScreen, animated: true)
        
        
    }
    
    
    @IBAction func glutenFreeButtonTapped(_ sender: UIButton) {
        
        let glutenFreeStoryboard = UIStoryboard (name: "GlutenToFoodIntolerance", bundle: Bundle.main)
        
        guard let toGlutenFreeScreen = glutenFreeStoryboard.instantiateViewController(withIdentifier: "GlutenToFoodIntolerance") as? GlutenFoodIntolerance else{
            return
        }
        navigationController?.pushViewController(toGlutenFreeScreen, animated: true)
    }
    
    
    
    
}
