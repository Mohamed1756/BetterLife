//
//  MyWorkoutsChoiceView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 21/01/2021.
//

import UIKit

class MyWorkoutsChoiceView:UIViewController {
    
    
    @IBAction func loseWeightButton(_ sender: Any) {
        
        let loseWeightStoryboard = UIStoryboard (name: "LoseWeightScreen", bundle: Bundle.main)
        
        guard let toLoseWeightStoryboard = loseWeightStoryboard.instantiateViewController(withIdentifier: "loseWeightScreenHome") as? LoseWeightScreen else {return}
        
        navigationController?.pushViewController(toLoseWeightStoryboard, animated: true)
    
    }
    
    @IBAction func buildMuscleButton(_ sender: Any) {
        
        let buildMuscleStoryboard = UIStoryboard (name: "BuildMuscleScreen", bundle: Bundle.main)
        
        guard let toBuildMuscleStoryboard = buildMuscleStoryboard.instantiateViewController(withIdentifier: "buildMuscleScreenHome") as? BuildMuscleView else {return}
        
        navigationController?.pushViewController(toBuildMuscleStoryboard, animated: true)
        
    }
    
    
    @IBAction func stayFitButton(_ sender: Any) {
    
        let stayFitStoryboard = UIStoryboard (name: "StayFitScreen", bundle: Bundle.main)
        
        guard let toStayFitStoryboard  = stayFitStoryboard.instantiateViewController(withIdentifier: "stayFitScreenHome") as? StayFitView else {return}
        
        navigationController?.pushViewController(toStayFitStoryboard, animated: true)

    }
    
}
