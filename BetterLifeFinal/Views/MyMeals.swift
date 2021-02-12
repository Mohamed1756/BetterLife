//
//  MyMeals.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 03/01/2021.
//

import UIKit

class MyMeals:UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backtoHomeScreen", sender: self)
        
    }
    
    
    @IBAction func nothingButton(_ sender: Any) {
        self.performSegue(withIdentifier: "noneToFoodIntolerance", sender: self )
    }
    
    
    
    
    
}
