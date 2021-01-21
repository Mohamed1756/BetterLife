//
//  MyWorkoutsChoiceView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 21/01/2021.
//

import UIKit

class MyWorkoutsChoiceView:UIViewController {
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "workoutBackToHome", sender: self)
    }
    
    
    @IBAction func loseWeightButton(_ sender: Any) {
        self.performSegue(withIdentifier: "LoseWeightScreen", sender: self)
    }
    
    @IBAction func buildMuscleButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ToBuildMuscleScreen", sender: self)
    }
    
    
    @IBAction func stayFitButton(_ sender: Any) {
        self.performSegue(withIdentifier: "ToStayFitScreen", sender: self)
    }
    
}
