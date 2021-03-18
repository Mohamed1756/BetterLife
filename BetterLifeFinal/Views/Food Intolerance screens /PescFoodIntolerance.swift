//
//  PescFoodIntolerance.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 05/01/2021.
//

import UIKit

class PescFoodIntolerance: UIViewController {
    
    @IBOutlet weak var textTitleOne: UILabel!
    
    @IBOutlet weak var textTitleTwo: UILabel!
    
    @IBOutlet weak var pescNoneButton: UIButton!
    
    @IBOutlet weak var pescEggsButton: UIButton!
    
    @IBOutlet weak var pescDairyButton: UIButton!
    
    @IBOutlet weak var pescGlutenButton: UIButton!
    
    @IBOutlet weak var pescWheatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textTitle()
        textButtonNames()
    }
    
    func textTitle() {
        textTitleOne.text = "Any Food"
        textTitleTwo.text = "Intolerance"
    }
    
    func textButtonNames(){
        pescNoneButton.setTitle("None", for: .normal)
        pescEggsButton.setTitle("Eggs", for: .normal)
        pescDairyButton.setTitle("Dairy", for: .normal)
        pescGlutenButton.setTitle("Gluten", for: .normal)
        pescWheatButton.setTitle("Wheat", for: .normal)
    }
    
}
