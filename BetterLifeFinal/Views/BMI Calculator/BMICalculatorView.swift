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
    
    @IBOutlet weak var heightSliderValues: UISlider!
    
    @IBOutlet weak var weightSliderValues: UISlider!
    
    
    // BMI variables - h = height, W = weight
    var height:Float = 1.5
    var weight:Float = 75
    var bmi:Float = 0
    
    override func viewDidLoad() {
       sliderValues()
        
    }
    
    func sliderValues() {
        // minimum Values for the slider
        heightSliderValues.minimumValue = 0.5
        weightSliderValues.minimumValue = 35
        
        // Maximum Values for the slider
        heightSliderValues.maximumValue = 2.5
        weightSliderValues.maximumValue = 150
        
    }
    
    
    
    @IBAction func heightSlider(_ sender: UISlider) {
        height = sender.value
        heightValue.text = NSString (format: " %.2f m", height) as String
    }
    
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weight = sender.value
        weightValue.text = NSString (format: " %.1f kg", weight) as String
        // 1 decimal
    }
    
    
    @IBAction func calculateBMIButton(_ sender: UIButton) {
        bmi = weight/(height*height)
        resultAnswer.text = NSString (format: " BMI value is %.2f ", bmi) as String
        
        if bmi < 18.5 {
            resultAnswer.text = NSString (format: " BMI value is %.2f: Under Weight ", bmi) as String
            resultAnswer.alpha = 1
            
        } else if bmi >= 18.5 && bmi < 25 {
            resultAnswer.text = NSString (format: " BMI value is %.2f: Normal Weight ", bmi) as String
            resultAnswer.alpha = 1

        } else if bmi >= 25 && bmi < 30 {
            resultAnswer.text = NSString (format: " BMI value is %.2f: Over Weight ", bmi) as String
            resultAnswer.alpha = 1

        } else {
            resultAnswer.text = NSString (format: " BMI value is %.2f:  Obese ", bmi) as String
            resultAnswer.alpha = 1

        }
        
    }
    }
    
    
    
    

