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
    
    
}
