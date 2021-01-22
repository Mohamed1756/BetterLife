//
//  LoseWeightScreen.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 22/01/2021.
//

import UIKit

class LoseWeightScreen: UIViewController {
    
    @IBAction func loseWeightBeginnerButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "loseWeightToBeginner", sender: self)
    }
    
    
    @IBAction func loseWeightIntermediateButton(_ sender: Any) {
        self.performSegue(withIdentifier: "loseWeightToIntermediate", sender: self)
    }
    
    @IBAction func loseWeightAdvancedButton(_ sender: Any) {
        self.performSegue(withIdentifier: "loseWeightToAdvanced", sender: self)
    }
    
    
    
}
