//
//  HomeScreenView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 03/01/2021.
//

import UIKit

class
HomeScreenVIew:UIViewController{
    
    
    override func viewDidLoad() {
        
    }
    
    
    
    @IBAction func MealsButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "mealsToFoodPref", sender: self)
        
    }
    
     
        
    
    
}
