//
//  LoseWeightScreen.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 22/01/2021.
//

import UIKit

class LoseWeightScreen: UIViewController {
    
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var beginnerButton: UIButton!
    
    @IBOutlet weak var intermediateButton: UIButton!
    
    @IBOutlet weak var advancedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.text = "What is your Fitness Level ?, select your preference"
        
        buttonTextNames()
    }
    
    func buttonTextNames() {
        
        beginnerButton.setTitle("Beginner", for: .normal)
        
        intermediateButton.setTitle("Intermediate", for: .normal)
        
        advancedButton.setTitle("Advanced", for: .normal)
    }
    
    
    @IBAction func beginnerButtonTapped(_ sender: Any) {
        
        let beginnerStoryboard = UIStoryboard (name: "LoseWeightScreen", bundle: Bundle.main)
        
        guard let toBeginnerStoryboard = beginnerStoryboard.instantiateViewController(withIdentifier: "beginnerLoseWeightScreen") as? LoseWeightScreen else {return}
        
        navigationController?.pushViewController(toBeginnerStoryboard, animated: true)
    }
    
    @IBAction func intermediateButtonTapped(_ sender: Any) {
        
        let intermediateStoryboard = UIStoryboard (name: "LoseWeightScreen", bundle: Bundle.main)
        
        guard let toIntermediateStoryboard = intermediateStoryboard.instantiateViewController(withIdentifier: "intermediateLoseWeightScreen") as? LoseWeightIntermediateViews else {return}
        
        navigationController?.pushViewController(toIntermediateStoryboard, animated: true)
    }
       
    
    @IBAction func advancedButtonTapped(_ sender: Any) {
        
        let advancedStoryboard = UIStoryboard (name: "LoseWeightScreen", bundle: Bundle.main)
        
        guard let toAdvancedStoryboard = advancedStoryboard.instantiateViewController(withIdentifier: "advancedLoseWeightScreen") as? LoseWeightAdvancedView else {return}
        
        navigationController?.pushViewController(toAdvancedStoryboard, animated: true)

    }
    
}
