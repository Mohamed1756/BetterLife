//
//  BMICalculatorView.swift
//  BetterLifeFinal
//
//  Created by Mohamed on 29/01/2021.
//

import UIKit

class BMICalculatorView:UIViewController {
    
    @IBOutlet weak var heightValue: UILabel!
    
    @IBOutlet weak var weightValue: UILabel!
    
    @IBOutlet weak var resultAnswer: UILabel!
    
    
    // BMI variables - h = height, W = weight
    var h:Float = 1.5
    var w:Float = 75
    var bmi:Float = 0
    
    
    @IBAction func heightSlider(_ sender: UISlider) {
        h = sender.value
        heightValue.text = NSString (format: " %.2f m", h) as String
    }
    
    
    @IBAction func weightSlider(_ sender: UISlider) {
        w = sender.value
        weightValue.text = NSString (format: " %.1f kg", w) as String
        // 1 decimal
    }
    
    
    @IBAction func calculateBMIButton(_ sender: UIButton) {
        bmi = w/(h*h)
        resultAnswer.text = NSString (format: " Your BMI value is %.2f ", bmi) as String
        
        if bmi < 18.5 {
            resultAnswer.text = NSString (format: " Your BMI value is %.2f ----> Under Weight ", bmi) as String
            resultAnswer.alpha = 1
            
        } else if bmi >= 18.5 && bmi < 25 {
            resultAnswer.text = NSString (format: " Your BMI value is %.2f ----> Normal Weight ", bmi) as String
            resultAnswer.alpha = 1

        } else if bmi >= 25 && bmi < 30 {
            resultAnswer.text = NSString (format: " Your BMI value is %.2f ----> Over Weight ", bmi) as String
            resultAnswer.alpha = 1

        } else {
            resultAnswer.text = NSString (format: " Your BMI value is %.2f ----> Obese ", bmi) as String
            resultAnswer.alpha = 1

        }
        
    }
    }
    
    
    
    

