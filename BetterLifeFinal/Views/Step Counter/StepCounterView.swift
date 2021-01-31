//
//  StepCounterView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 30/01/2021.
//

import UIKit
import CoreMotion

class StepCounterViews: UIViewController {
    
    
    @IBOutlet weak var stepCounterTextLabel: UILabel!
    
    let activityManager = CMMotionActivityManager()
    let pedometerFeature = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // validating
        if CMMotionActivityManager.isActivityAvailable() {
            self.activityManager.startActivityUpdates(to: OperationQueue.main) { (data) in
                DispatchQueue.main.async {
                    if let activity = data {
                        if activity.walking == true {
                            print("User walk ")
                        }
                    }
                    
                }
            }
        }
        if CMPedometer.isStepCountingAvailable() {
            self.pedometerFeature.startUpdates(from: Date()) { (data, error) in
                if error == nil {
                    if let response = data {
                        DispatchQueue.main.async {
                            print("Number of steps == \(response.numberOfSteps)")
                            self.stepCounterTextLabel.text = "\(response.numberOfSteps) Steps Taken"
                        }
                    }
                }
            }
        }
    }
    
}
