//
//  MyWorkoutsChoiceView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 21/01/2021.
//

import UIKit

class MyWorkoutsChoiceView:UIViewController {
    
    @IBOutlet weak var loseWeightTextLabel: UILabel!
    @IBOutlet weak var buildMuscleTextLabel: UILabel!
    @IBOutlet weak var workoutChoiceTextLabel: UILabel!
    
    @IBOutlet weak var stayFitTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loseWeightTextLabel.text = "Lose Weight"
        buildMuscleTextLabel.text = "Build Muscle"
        stayFitTextLabel.text = "Stay Fit"
        workoutChoiceTextLabel.text = "What Are Your Fitness Goals ?"
    }
    
    
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
