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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    @IBAction func logOutButton(_ target:UIBarButtonItem) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func MealsButton(_ sender: UIButton) {
    
    }
    
    @IBAction func WorkoutButton(_ sender: Any) {
        
        }
    
    

    
        
    
     
        
    
    
}
