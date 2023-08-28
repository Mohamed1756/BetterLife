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

    
    @IBAction func progressButtonTapped(_ sender: Any) {
        
        let progressScreenStoryboard = UIStoryboard(name: "HomeScreen", bundle: Bundle.main)
        
        guard let toProgressScreen = progressScreenStoryboard.instantiateViewController(withIdentifier: "progressScreenHome") as? EditProfileView else {return}
        
        navigationController?.pushViewController(toProgressScreen, animated: true)
    }
    
    @IBAction func mealsButtonTapped(_ sender: UIButton) {

        
        let mealsScreenStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let toMealsScreen = mealsScreenStoryboard.instantiateViewController(withIdentifier: "myMealsScreen") as? MyMeals else {return}
        
        navigationController?.pushViewController(toMealsScreen, animated: true)
        
        
    }
    
    
    @IBAction func bmiButtonTapped(_ sender: Any) {
        
        let bmiScreenStoryboard = UIStoryboard(name: "BMICalculatorScreen", bundle: Bundle.main)
       
        guard let toBmiScreenStoryboard = bmiScreenStoryboard.instantiateViewController(withIdentifier: "BMIScreen") as? BMICalculatorView else {return}
        
        navigationController?.pushViewController(toBmiScreenStoryboard, animated: true)
        
    }
    
    @IBAction func myStepsButtonTapped(_ sender: Any) {
        
        let myStepsStoryboard = UIStoryboard(name: "StepCounterScreen", bundle: Bundle.main)
       
        guard let toMyStepsStoryboard = myStepsStoryboard.instantiateViewController(withIdentifier: "myStepsScreen") as? StepCounterViews else {return}
       
        navigationController?.pushViewController(toMyStepsStoryboard, animated: true)
        
    }
    
    
    @IBAction func workoutButtonTapped(_ sender: Any) {
        
        let workoutStoryboard = UIStoryboard(name: "MyFitnessGoalScreen", bundle: Bundle.main)
        
        guard let toWorkoutStoryboard = workoutStoryboard.instantiateViewController(withIdentifier: "workoutScreenHome") as? MyWorkoutsChoiceView else {return}
        
        navigationController?.pushViewController(toWorkoutStoryboard, animated: true)
       
    }
    
    }
    
        
    
     
        
    

