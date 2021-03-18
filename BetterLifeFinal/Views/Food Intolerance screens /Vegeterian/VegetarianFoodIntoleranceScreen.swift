//
//  VegetarianFoodIntoleranceScreen.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 10/02/2021.
//

import UIKit

class VegetarainFoodIntoleranceScreen:UIViewController {
    
    
    
    @IBOutlet weak var vegNoneButton: UIButton!
    
    @IBOutlet weak var vegEggButton: UIButton!
    
    @IBOutlet weak var vegDairyButton: UIButton!
    
    @IBOutlet weak var vegNutsButton: UIButton!
    
    @IBOutlet weak var vegGlutenButton: UIButton!
    
    @IBOutlet weak var vegWheatButton: UIButton!
    
    
    @IBOutlet weak var textTitleOne: UILabel!
    
    @IBOutlet weak var textTitleTwo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonTexts()
        titleText()
    }
    
    // Button Text
    
    func buttonTexts(){
        
        vegNoneButton.setTitle("None", for: .normal)
        vegEggButton.setTitle("Eggs", for: .normal)
        vegDairyButton.setTitle("Dairy", for: .normal)
        vegNutsButton.setTitle("Nuts", for: .normal)
        vegGlutenButton.setTitle("Gluten", for: .normal)
        vegWheatButton.setTitle("Wheat", for: .normal)
    }
    
    // Screen Title
    func titleText (){
        textTitleOne.text = "Any Food"
        textTitleTwo.text = "Intolerance"
    
    }
}
