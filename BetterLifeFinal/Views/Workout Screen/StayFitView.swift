//
//  StayFitView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 22/01/2021.
//

import UIKit

class StayFitView:UIViewController {
    
    
    
    @IBAction func stayFitBeginnerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "stayFitToBeginner", sender: self)
    }
    
    
    @IBAction func stayFitIntermediateButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "stayFitToIntermediate", sender: self)
    }
    
    
    @IBAction func stayFitAdvancedButton(_ sender: Any) {
        self.performSegue(withIdentifier: "stayFitToAdvanced", sender: self)
    }
    
    
}
