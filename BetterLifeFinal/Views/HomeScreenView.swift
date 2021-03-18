//
//  HomeScreenView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 03/01/2021.
//

import UIKit
import Firebase

class
HomeScreenVIew:UIViewController{
    
    @IBOutlet weak var myMealsText: UIButton!
    
    @IBOutlet weak var myStepsText: UIButton!
    
    @IBOutlet weak var progressScreenText: UIButton!
  
    @IBOutlet weak var BmiText: UIButton!
    
    @IBOutlet weak var myWorkoutText: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMealsText.setTitle("My Meals", for: .normal)
        myStepsText.setTitle("My Steps", for: .normal)
        BmiText.setTitle("BMI", for: .normal )
        myWorkoutText.setTitle("My Workouts", for: .normal)
        progressScreenText.setTitle("Progress", for: .normal)
    
    }
    
    @IBAction func logOutButton(_ target:UIBarButtonItem) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
    }
    
    
    }
    
        
    
     
        
    

