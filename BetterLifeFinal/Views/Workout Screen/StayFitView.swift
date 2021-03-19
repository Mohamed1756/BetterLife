//
//  StayFitView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 22/01/2021.
//

import UIKit

class StayFitView:UIViewController {
    
    
    @IBOutlet weak var textTitle: UILabel!
    
    @IBOutlet weak var beginnerButton: UIButton!
    
    @IBOutlet weak var intermediateButton: UIButton!
    
    @IBOutlet weak var advancedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTitle.text = "What is your Fitness Level ?, select your preference"
        
        buttonTextNames()
    }
    
    func buttonTextNames (){
        
        beginnerButton.setTitle("Beginner", for: .normal)
        
        intermediateButton.setTitle("Intermediate", for: .normal)
        
        advancedButton.setTitle("Advanced", for: .normal)
    }
    
    
    @IBAction func beginnerButtonTapped(_ sender: Any) {
        
        let beginnerStoryboard = UIStoryboard (name: "StayFitScreen", bundle: Bundle.main)
        
        guard let toBeginnerStoryboard = beginnerStoryboard.instantiateViewController(withIdentifier: "beginnerStayFitScreen") as? StayFitBeginner else {return}
        
        navigationController?.pushViewController(toBeginnerStoryboard, animated: true)
    }
    
    
    @IBAction func intermediateButtonTapped(_ sender: Any) {
        
        let intermediateStoryboard = UIStoryboard (name: "StayFitScreen", bundle: Bundle.main)
        
        guard let toIntermediateStoryboard = intermediateStoryboard.instantiateViewController(withIdentifier: "intermediateStayFitScreen") as? StayFitIntermediateViews else {return}
        
        navigationController?.pushViewController(toIntermediateStoryboard, animated: true)
    }
    
    
    @IBAction func advancedButtonTapped(_ sender: Any) {
        
        let advancedStoryboard = UIStoryboard (name: "StayFitScreen", bundle: Bundle.main)
        
        guard let toAdvancedStoryboard = advancedStoryboard.instantiateViewController(withIdentifier: "advancedStayFitScreen") as? StayFitAdvancedViews else {return}
        
        navigationController?.pushViewController(toAdvancedStoryboard, animated: true)
    }
    
    
    
}
