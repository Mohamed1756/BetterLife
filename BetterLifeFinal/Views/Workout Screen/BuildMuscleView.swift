//
//  BuildMuscleView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 22/01/2021.
//

import UIKit

class BuildMuscleView: UIViewController {
    
 
    @IBAction func buildMuscleBeginnerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "buildMuscleToBeginner", sender: self)
        
    }
    
    
    @IBAction func buildMuscleIntermediateButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "buildMuscleToIntermediate", sender: self)
        
    }
    
    
    @IBAction func buildMuscleAdvancedButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "buildMuscleToAdvanced", sender: self)
    }
    
    
    
}
