//
//  WorkoutScreen.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 25/01/2021.
//

import UIKit

class WorkoutScreen:UIViewController {
    
    
    @IBOutlet weak var workoutImage: UIImageView!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var dayTextLabel: UILabel!
    
    @IBOutlet weak var workoutDetailsTextLabel: UITextView!
    
    var sentData1:String!
    var sentData2:String!
    var sentData3:String!
    var sentData4:String!
    
    override func viewDidLoad() {
        
        titleTextLabel.text = sentData1
        dayTextLabel.text = sentData2
        workoutImage.image = UIImage(named: sentData3)
        workoutDetailsTextLabel.text = sentData4
        
    }
}
