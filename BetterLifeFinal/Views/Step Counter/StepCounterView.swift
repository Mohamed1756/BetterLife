import UIKit
import CoreMotion

class StepCounterViews: UIViewController {
    
    @IBOutlet weak var stepCounterTextLabel: UILabel!
    
    let activityManager = CMMotionActivityManager()
    let pedometerFeature = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startActivityUpdates()
        startPedometerUpdates()
    }
    
    func startActivityUpdates() {
        if CMMotionActivityManager.isActivityAvailable() {
            activityManager.startActivityUpdates(to: .main) { [weak self] (data) in
                if let activity = data, activity.walking {
                    print("User is walking")
                }
            }
        }
    }
    
    func startPedometerUpdates() {
        if CMPedometer.isStepCountingAvailable() {
            let startDate = Date()
            pedometerFeature.startUpdates(from: startDate) { [weak self] (data, error) in
                if let response = data, error == nil {
                    DispatchQueue.main.async {
                        self?.updateStepCounterLabel(with: response.numberOfSteps)
                    }
                }
            }
        }
    }
    
    func updateStepCounterLabel(with stepCount: NSNumber) {
        let formattedStepCount = NumberFormatter.localizedString(from: stepCount, number: .decimal)
        stepCounterTextLabel.text = "\(formattedStepCount) Steps"
    }
}
