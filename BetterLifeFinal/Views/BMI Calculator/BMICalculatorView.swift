import UIKit

class BMICalculatorView: UIViewController {
    // Outlets
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var resultAnswer: UILabel!
    @IBOutlet weak var heightSliderValues: UISlider!
    @IBOutlet weak var weightSliderValues: UISlider!

    // Properties
    var height: Float = 1.5
    var weight: Float = 75
    var bmi: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliderValues()
    }

    // Set up slider minimum and maximum values
    func setupSliderValues() {
        heightSliderValues.minimumValue = 0.5
        weightSliderValues.minimumValue = 35
        heightSliderValues.maximumValue = 2.5
        weightSliderValues.maximumValue = 150
    }

    // Update height label when slider value changes
    @IBAction func heightSlider(_ sender: UISlider) {
        height = sender.value
        heightValue.text = String(format: "%.2f m", height)
    }

    // Update weight label when slider value changes
    @IBAction func weightSlider(_ sender: UISlider) {
        weight = sender.value
        weightValue.text = String(format: "%.1f kg", weight)
    }

    // Calculate BMI and update result label
    @IBAction func calculateBMIButton(_ sender: UIButton) {
        bmi = weight / (height * height)
        updateResultLabel()
    }

    // Update result label with BMI value and interpretation
    func updateResultLabel() {
        var interpretation = ""
        if bmi < 18.5 {
            interpretation = "Underweight"
        } else if bmi < 25 {
            interpretation = "Normal Weight"
        } else if bmi < 30 {
            interpretation = "Overweight"
        } else {
            interpretation = "Obese"
        }
        resultAnswer.text = String(format: "BMI value is %.2f: %@", bmi, interpretation)
    }
}
