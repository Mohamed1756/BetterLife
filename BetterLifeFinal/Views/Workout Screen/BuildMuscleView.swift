import UIKit

class BuildMuscleView: UIViewController {
    

    @IBOutlet weak var titleTextScreen: UILabel!
    
    @IBOutlet weak var beginnerButton: UIButton!
    
    @IBOutlet weak var intermediateButton: UIButton!
    
    @IBOutlet weak var advancedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextScreen.text = "What is your Fitness Level ?, select your preference"
        
        buttonTextNames()
    }
    
    func buttonTextNames(){
        beginnerButton.setTitle("Beginner", for: .normal)
        
        intermediateButton.setTitle("Intermediate", for: .normal)
        
        advancedButton.setTitle("Advanced", for: .normal)
    }
    
    @IBAction func beginnerButtonTapped(_ sender: Any) {
        
        let beginnerStoryboard = UIStoryboard (name: "BuildMuscleScreen", bundle: Bundle.main)
        
        guard let toBeginnerStoryboard = beginnerStoryboard.instantiateViewController(withIdentifier: "beginnerBuildMuscleScreen") as? BuildMuscleBeginner else {return}
        
        navigationController?.pushViewController(toBeginnerStoryboard, animated: true)
        
    }
    
    @IBAction func intermediateButtonTapped(_ sender: Any) {
        
        
        let intermediateStoryboard = UIStoryboard (name: "BuildMuscleScreen", bundle: Bundle.main)
        
        guard let toIntermediateStoryboard = intermediateStoryboard.instantiateViewController(withIdentifier: "intermediateBuildMuscleScreen") as? BuildMuscleIntermediateViews else {return}
        
        navigationController?.pushViewController(toIntermediateStoryboard, animated: true)
    }
    
    @IBAction func advancedButtonTapped(_ sender: Any) {
       
        let advancedStoryboard = UIStoryboard (name: "BuildMuscleScreen", bundle: Bundle.main)
        
        guard let toAdvancedStoryboard = advancedStoryboard.instantiateViewController(withIdentifier: "advancedBuildMuscleScreen") as? BuildMuscleAdvancedViews else {return}
        
        navigationController?.pushViewController(toAdvancedStoryboard, animated: true)

    }
    
    
}
