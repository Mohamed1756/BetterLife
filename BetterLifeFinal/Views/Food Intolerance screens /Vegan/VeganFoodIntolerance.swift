//
//  VeganFoodIntolerance.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 05/01/2021.
//

import UIKit

class VeganFoodIntolerance:UIViewController {
    
   
    @IBOutlet weak var textTitleOne: UILabel!
    
    @IBOutlet weak var textTitleTwo: UILabel!
    
    @IBOutlet weak var veganNoneButton: UIButton!
    
    @IBOutlet weak var veganCeleryButton: UIButton!
    
    @IBOutlet weak var veganNutsButton: UIButton!
    
    @IBOutlet weak var veganGlutenButton: UIButton!
    
    @IBOutlet weak var veganWheatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText()
        textButtonNames()
    }
    
    
    func titleText() {
        textTitleOne.text = "Any Food"
        textTitleTwo.text = "Intolerance"
    }
    
    func textButtonNames(){
        veganNoneButton.setTitle("None", for: .normal)
        veganCeleryButton.setTitle("Celery", for: .normal)
        veganNutsButton.setTitle("Nuts", for: .normal)
        veganGlutenButton.setTitle("Gluten", for: .normal)
        veganWheatButton.setTitle("Wheat", for: .normal)
    }
}
